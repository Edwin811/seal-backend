# Backend Technical Test - Leave Management System

Sistem Manajemen Cuti Karyawan (RESTful API) yang dibangun untuk seleksi Magang Mandiri SEAL Batch 1 2026. Proyek ini menerapkan prinsip **Clean Architecture** untuk memastikan kode yang *scalable*, *maintainable*, dan *testable*.

## 🛠 Tech Stack
- **Framework:** Laravel 10/11
- **Language:** PHP 8.2+
- **Database:** MySQL
- **Authentication:** Laravel Sanctum (JWT) & Laravel Socialite (Google OAuth)
- **Architecture:** Service-Repository Pattern with Dependency Injection

## 🏗 Architecture Overview (Nilai Plus)
Sistem ini tidak menaruh logika bisnis di dalam Controller. Saya menerapkan **Service-Repository Pattern** untuk memisahkan *concern* aplikasi:

### 1. Layering Structure
- **Interfaces (`App\Interfaces`)**:
  Menyediakan kontrak standar. Ini memungkinkan kita mengganti implementasi database (misal dari MySQL ke PostgreSQL) tanpa mengubah kode bisnis sedikitpun.
  
- **Repositories (`App\Repositories`)**:
  *Data Access Layer*. Bertanggung jawab murni untuk komunikasi ke database (Eloquent Queries). Controller tidak boleh tahu cara query DB secara langsung.

- **Services (`App\Services`)**:
  *Business Logic Layer*. "Otak" dari aplikasi. Semua aturan bisnis validasi kompleks ada di sini.
  > **Contoh Implementasi:** Logika pengecekan kuota "Maksimal 12 Hari per Tahun" dilakukan di `LeaveService`, bukan di Controller.

- **Controllers (`App\Http\Controllers`)**:
  Hanya bertugas menerima Request HTTP, memanggil Service, dan mengembalikan Response JSON. Controller tetap "bersih" (*Skinny Controllers*).

### 2. Design Pattern Benefits
- **Separation of Concerns:** Perubahan pada logika database tidak merusak logika bisnis.
- **Reusability:** Logika hitung kuota cuti bisa dipanggil dari API, Command Line, atau Job Queue tanpa duplikasi kode.
- **Security:** Validasi input dan otorisasi role (Admin/Employee) dilakukan berlapis (Middleware & Service).

## 🚀 Fitur Utama
1. **Otentikasi Ganda:** Login email/password konvensional & Login Google (OAuth).
2. **Role Management:**
   - **Employee:** Mengajukan cuti, melihat status sendiri.
   - **Admin:** Melihat semua pengajuan, menyetujui/menolak (Approve/Reject).
3. **Validasi Bisnis:**
   - Cek otomatis sisa kuota (Limit 12 hari/tahun).
   - Validasi tanggal (End Date tidak boleh sebelum Start Date).
   - Upload bukti lampiran (File handling).