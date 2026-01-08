<?php

namespace App\Interfaces;

interface LeaveRepositoryInterface
{
    public function getAll();
    public function getByUserId($userId);
    public function create(array $data);
    public function updateStatus($id, $status);
    public function countApprovedDays($userId, $year);
}
