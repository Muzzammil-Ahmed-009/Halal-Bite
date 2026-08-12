const functions = require('firebase-functions');
const admin = require('firebase-admin');
const crypto = require('crypto');

admin.initializeApp();
const db = admin.firestore();
const storage = admin.storage();

exports.generateDatabaseJson = functions.https.onRequest(async (req, res) => {
  try {
    // 1. Fetch all ingredients
    const snapshot = await db.collection('ingredients').get();
    const ingredients = [];
    
    snapshot.forEach(doc => {
      const data = doc.data();
      ingredients.push({
        id: doc.id,
        name: data.name || '',
        aliases: data.aliases || [],
        searchTokens: data.searchTokens || [],
        scientificName: data.scientificName || null,
        eNumber: data.eNumber || null,
        status: data.status || 'unknown',
        category: data.category || 'uncategorized',
        origin: data.origin || 'unknown',
        animalDerived: data.animalDerived || false,
        plantDerived: data.plantDerived || false,
        synthetic: data.synthetic || false,
        riskLevel: data.riskLevel || 'low',
        explanation: data.explanation || '',
        scholarlyNotes: data.scholarlyNotes || null,
        languageVariants: data.languageVariants || null,
        possibleSources: data.possibleSources || null,
        references: data.references || null,
        createdAt: data.createdAt ? data.createdAt.toDate().toISOString() : new Date().toISOString(),
        updatedAt: data.updatedAt ? data.updatedAt.toDate().toISOString() : new Date().toISOString(),
        verifiedBy: data.verifiedBy || 'system'
      });
    });

    // 2. Stringify and Hash
    const jsonString = JSON.stringify(ingredients);
    const hash = crypto.createHash('sha256').update(jsonString).digest('hex');

    // 3. Upload to Firebase Storage
    const bucket = storage.bucket();
    const file = bucket.file('database/ingredients.json');
    
    await file.save(jsonString, {
      metadata: {
        contentType: 'application/json',
      }
    });

    // Make the file publicly accessible (if bucket is public, or we can use signed URLs, but usually a public read url is fine for this)
    await file.makePublic();
    const publicUrl = `https://storage.googleapis.com/${bucket.name}/database/ingredients.json`;

    // 4. Update Metadata
    const metadataRef = db.collection('app_config').doc('database_metadata');
    const metadataDoc = await metadataRef.get();
    
    let newVersion = 1;
    if (metadataDoc.exists) {
      const currentData = metadataDoc.data();
      // Only increment version if hash is different
      if (currentData.sha256_hash === hash) {
        return res.status(200).send("No changes detected. Database is up to date.");
      }
      newVersion = (currentData.latest_version || 0) + 1;
    }

    await metadataRef.set({
      latest_version: newVersion,
      sha256_hash: hash,
      download_url: publicUrl,
      updated_at: admin.firestore.FieldValue.serverTimestamp()
    });

    res.status(200).send(`Successfully generated database version ${newVersion}.`);
    
  } catch (error) {
    console.error('Error generating database:', error);
    res.status(500).send('Internal Server Error: ' + error.message);
  }
});
