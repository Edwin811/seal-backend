<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Interfaces\LeaveRepositoryInterface;
use App\Repositories\LeaveRepository;

class AppServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind(LeaveRepositoryInterface::class, LeaveRepository::class);
    }

    public function boot(): void
    {
    }
}
