<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\LeaveController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// Public Routes
Route::post('/login', [AuthController::class, 'login']);
Route::get('/auth/google', [AuthController::class, 'redirectToGoogle']);
Route::get('/auth/google/callback', [AuthController::class, 'handleGoogleCallback']);

// Protected Routes (Butuh Token)
Route::middleware('auth:sanctum')->group(function () {
    
    Route::post('/logout', [AuthController::class, 'logout']);

    // Leave Routes
    Route::get('/leaves', [LeaveController::class, 'index']);      // List Cuti
    Route::post('/leaves', [LeaveController::class, 'store']);     // Ajukan Cuti
    Route::put('/leaves/{id}/status', [LeaveController::class, 'updateStatus']); // Approve/Reject (Admin)
    
});
