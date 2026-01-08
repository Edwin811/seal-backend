<?php

namespace App\Repositories;

use App\Interfaces\LeaveRepositoryInterface;
use App\Models\LeaveRequest;
use Carbon\Carbon;

class LeaveRepository implements LeaveRepositoryInterface
{
    public function getAll()
    {
        return LeaveRequest::with('user')->orderBy('created_at', 'desc')->get();
    }

    public function getByUserId($userId)
    {
        return LeaveRequest::where('user_id', $userId)->orderBy('created_at', 'desc')->get();
    }

    public function create(array $data)
    {
        return LeaveRequest::create($data);
    }

    public function updateStatus($id, $status)
    {
        $leave = LeaveRequest::find($id);
        if ($leave) {
            $leave->status = $status;
            $leave->save();
        }
        return $leave;
    }

    public function countApprovedDays($userId, $year)
    {
        $leaves = LeaveRequest::where('user_id', $userId)
            ->where('status', 'approved')
            ->whereYear('start_date', $year)
            ->get();

        $totalDays = 0;
        foreach ($leaves as $leave) {
            $start = Carbon::parse($leave->start_date);
            $end = Carbon::parse($leave->end_date);
            
            // PERBAIKAN DI SINI: Tambahkan abs() agar tidak minus!
            $diff = abs($end->diffInDays($start)) + 1;
            
            $totalDays += $diff;
        }
        return $totalDays;
    }
}
