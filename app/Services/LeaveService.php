<?php

namespace App\Services;

use App\Interfaces\LeaveRepositoryInterface;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\UploadedFile;

class LeaveService
{
    protected $leaveRepo;

    public function __construct(LeaveRepositoryInterface $leaveRepo)
    {
        $this->leaveRepo = $leaveRepo;
    }

    public function requestLeave($user, array $data, ?UploadedFile $file)
    {
        $start = Carbon::parse($data['start_date']);
        $end = Carbon::parse($data['end_date']);
        
        
        
        $daysRequested = abs($start->diffInDays($end)) + 1;

        $usedDays = $this->leaveRepo->countApprovedDays($user->id, $start->year);

        
        if (($usedDays + $daysRequested) > 12) {
            throw new Exception("Kuota cuti tidak mencukupi. Anda meminta {$daysRequested} hari, sisa kuota: " . (12 - $usedDays) . " hari.");
        }

        
        if ($file) {
            $path = $file->store('attachments', 'public');
            $data['attachment'] = $path;
        }

        $data['user_id'] = $user->id;
        $data['status'] = 'pending'; 

        return $this->leaveRepo->create($data);
    }

    public function processApproval($id, $status)
    {
        if (!in_array($status, ['approved', 'rejected'])) {
            throw new Exception("Status tidak valid.");
        }
        return $this->leaveRepo->updateStatus($id, $status);
    }
}
