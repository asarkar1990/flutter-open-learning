/* eslint-disable no-unused-vars */
/* eslint-disable no-console */
"use strict"
const fbcf = require("firebase-functions")
const functions = fbcf.region("asia-east2")
// The Firebase Admin SDK to access the Firebase Firestore Database.
const admin = require("firebase-admin")
admin.initializeApp()
const db = admin.firestore()

let masterProductsRef

exports.onContentWrite = functions.firestore
  .document("contents/{contentId}")
  .onWrite((change, context) => {
    const snap = change.after.exists ? change.after : null
    if (change.after.exists) {
      const content = snap.data()
      const category = content.category
      const subjectRef = db.doc("subjects/" + content.subject.id)
      const data = {
        categories: admin.firestore.FieldValue.arrayUnion(category),
        categoryIds: admin.firestore.FieldValue.arrayUnion(category.id)
      }
      subjectRef.set(data, { merge: true })
    }
  })
