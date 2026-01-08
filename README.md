# Backend Technical Test - Leave Management System

Sistem RESTful API untuk manajemen cuti karyawan yang dibangun menggunakan **Laravel 11**. Proyek ini menerapkan prinsip **Clean Architecture** (Service-Repository Pattern) untuk memastikan kode yang *scalable*, *testable*, dan *maintainable*, serta mendukung otentikasi ganda (Konvensional & OAuth).

## 🛠 Tech Stack
- **Framework:** Laravel 11
- **Database:** MySQL
- **Authentication:** - **Laravel Sanctum** (Token-based Auth)
  - **Laravel Socialite** (Google OAuth Integration)
- **Architecture:** Service-Repository Design Pattern

## 🏗 Architecture Overview (Clean Code)
Sistem ini dirancang untuk tidak menumpuk logika bisnis di dalam Controller (*Skinny Controller*). Saya memisahkan tanggung jawab kode ke dalam beberapa layer:

### 1. The Layers
* **Interfaces (`App\Interfaces`)**
    Menyediakan kontrak standar untuk Repository. Ini menerapkan prinsip *Dependency Inversion*, memudahkan jika suatu saat perlu mengganti implementasi database tanpa merusak logika bisnis.

* **Repositories (`App\Repositories`)** *(Data Access Layer)*
    Bertanggung jawab murni untuk komunikasi ke database (Eloquent Queries). Layer ini mengabstraksi kompleksitas query SQL dari layer bisnis.

* **Services (`App\Services`)** *(Business Logic Layer)*
    Ini adalah "otak" dari aplikasi. Semua validasi bisnis kompleks terjadi di sini, bukan di Controller.
    * *Contoh:* Logika pengecekan sisa kuota (Max 12 hari) dan penghitungan durasi cuti dilakukan di `LeaveService`.

* **Controllers (`App\Http\Controllers`)** *(Presentation Layer)*
    Hanya bertugas menerima HTTP Request, memanggil Service yang sesuai, dan mengembalikan JSON Response standar.

### 2. Alur Request (Flow)
`User Request` -> `Route` -> `Controller` -> `Service (Validasi Bisnis)` -> `Repository (Query DB)` -> `Database`.

---

## 🚀 Fitur Utama

### 1. Authentication & Authorization
* **Hybrid Login:** Mendukung login email/password dan **Google OAuth**.
* **Role Management:**
    * **Employee:** Hanya dapat mengajukan cuti dan melihat riwayat pengajuan miliknya sendiri.
    * **Admin:** Memiliki akses penuh melihat semua pengajuan dan melakukan eksekusi (*Approve/Reject*).

### 2. Manajemen Cuti (Business Logic)
* **Validasi Kuota:** Sistem otomatis menghitung total cuti yang diambil tahun berjalan. Jika melebihi **12 hari**, pengajuan otomatis ditolak oleh Service.
* **Penghitungan Durasi:** Durasi cuti dihitung otomatis berdasarkan *Start Date* dan *End Date*.
* **File Attachment:** Mendukung upload bukti pendukung (surat dokter, dll).

---

## ⚙️ Panduan Instalasi (Setup)

Ikuti langkah ini untuk menjalankan proyek di lokal:

1.  **Clone Repository**
    ```bash
    git clone <URL_REPO_GITHUB_KAMU>
    cd <NAMA_FOLDER>
    ```

2.  **Install Dependencies**
    ```bash
    composer install
    ```

3.  **Setup Environment**
    Salin file `.env` dan sesuaikan konfigurasi Database & Google OAuth.
    ```bash
    cp .env.example .env
    ```
    *Pastikan mengisi:*
    ```ini
    DB_DATABASE=seal_db
    GOOGLE_CLIENT_ID=your_client_id
    GOOGLE_CLIENT_SECRET=your_client_secret
    GOOGLE_REDIRECT_URL=[http://127.0.0.1:8000/api/auth/google/callback](http://127.0.0.1:8000/api/auth/google/callback)
    ```

4.  **Database Setup**
    Jalankan migrasi dan seeder untuk membuat akun Admin & Employee default.
    ```bash
    php artisan key:generate
    php artisan storage:link
    php artisan migrate --seed
    ```

5.  **Jalankan Server**
    ```bash
    php artisan serve
    ```

---

## 📖 Dokumentasi API (Postman)

Dokumentasi lengkap mengenai Endpoint, Payload Request, dan Contoh Response dapat dilihat pada link berikut:

👉 **https://documenter.getpostman.com/view/42835150/2sBXVeFXVg**

### Akun Testing (Seeder)
* **Admin:** `admin@seal.com` | Pass: `password`
* **Employee:** `employee@seal.com` | Pass: `password`

---
Dibuat oleh: **Edwin Santoso**
