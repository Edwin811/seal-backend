<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\LeaveService;
use App\Interfaces\LeaveRepositoryInterface;

class LeaveController extends Controller
{
    protected $leaveService;
    protected $leaveRepo;

    public function __construct(LeaveService $leaveService, LeaveRepositoryInterface $leaveRepo)
    {
        $this->leaveService = $leaveService;
        $this->leaveRepo = $leaveRepo;
    }

    public function index(Request $request)
    {
        
        if ($request->user()->role === 'admin') {
            $data = $this->leaveRepo->getAll();
        } else {
            $data = $this->leaveRepo->getByUserId($request->user()->id);
        }
        return response()->json(['data' => $data]);
    }

    public function store(Request $request)
    {
        
        $request->validate([
            'start_date' => 'required|date',
            'end_date'   => 'required|date|after_or_equal:start_date',
            'reason'     => 'required|string',
            'attachment' => 'nullable|file|mimes:pdf,jpg,png,doc|max:2048'
        ]);

        try {
            
            $leave = $this->leaveService->requestLeave(
                $request->user(), 
                $request->all(), 
                $request->file('attachment')
            );
            
            return response()->json(['message' => 'Pengajuan berhasil', 'data' => $leave], 201);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }

    public function updateStatus(Request $request, $id)
    {
        
        if ($request->user()->role !== 'admin') {
            return response()->json(['message' => 'Forbidden Access'], 403);
        }

        $request->validate(['status' => 'required|in:approved,rejected']);

        try {
            $updated = $this->leaveService->processApproval($id, $request->status);
            return response()->json(['message' => 'Status diperbarui', 'data' => $updated]);
        } catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage()], 400);
        }
    }
}
