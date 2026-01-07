<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // 1. Buat Akun ADMIN
        User::create([
            'name' => 'Admin SEAL',
            'email' => 'admin@seal.com',
            'password' => Hash::make('password'), // Passwordnya: password
            'role' => 'admin',
        ]);

        // 2. Buat Akun EMPLOYEE
        User::create([
            'name' => 'Edwin Employee',
            'email' => 'employee@seal.com',
            'password' => Hash::make('password'), // Passwordnya: password
            'role' => 'employee',
        ]);
        
        echo "User Admin & Employee berhasil dibuat!\n";
        echo "Admin: admin@seal.com | password\n";
        echo "Employee: employee@seal.com | password\n";
    }
}
