# **SQLite to Firebase Synchronization**

A Flutter application that demonstrates the synchronization of local SQLite database with Firebase Firestore. This project is useful for scenarios where offline data management is required, and the data needs to be uploaded to the cloud when the device is online.

---

## **Features**
- **SQLite Integration**: Local data storage using SQLite for offline functionality.
- **Firebase Firestore Integration**: Synchronization of local data to Firebase Firestore.
- **CRUD Operations**:
  - Add new users.
  - Retrieve and display users from SQLite.
  - Delete users from SQLite.
  - Sync local data with Firebase Firestore.

---

## **Getting Started**

### **Prerequisites**
Ensure you have the following installed:
1. [Flutter SDK](https://docs.flutter.dev/get-started/install)
2. [Firebase CLI](https://firebase.google.com/docs/cli)
3. Android Studio or Xcode for device emulation.

### **Firebase Setup**
1. Go to [Firebase Console](https://console.firebase.google.com/).
2. Create a new project.
3. Add an Android or iOS app to the project.
4. Download the `google-services.json` file for Android or `GoogleService-Info.plist` for iOS.
5. Place the file in the appropriate directories:
   - `google-services.json` → `android/app`
   - `GoogleService-Info.plist` → `ios/Runner`

6. Add Firestore to your project by enabling it in the Firebase Console.

---

### **Installation**
1. Clone this repository:
   ```bash
   git clone https://github.com/adipramanadev/sinkronisasilokal
   cd sinkronisasilokal
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```



## **Usage**
1. Launch the app.
2. Add users locally using the input fields.
3. View the list of users stored in SQLite.
4. Click the "Sync" button (cloud icon) to upload the local data to Firebase Firestore.

---

## **Technologies Used**
- **Flutter**: Frontend framework for cross-platform app development.
- **SQLite**: Local database for offline storage.
- **Firebase Firestore**: Cloud NoSQL database for online storage.

---

## **Contributing**
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/your-feature
   ```
3. Commit your changes:
   ```bash
   git commit -m "Add your message"
   ```
4. Push the branch:
   ```bash
   git push origin feature/your-feature
   ```
5. Open a pull request.

---

## **License**
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

## **Screenshots**
### **Main Screen**
![Main Screen](https://via.placeholder.com/400x300.png?text=Main+Screen)

### **Sync Button**
![Sync Screen](https://via.placeholder.com/400x300.png?text=Sync+Button)

---

## **Author**
**Your Name**  
- GitHub: [adipramanadev](https://github.com/adipramanadev)  
- Email: your.email@example.com  

---

