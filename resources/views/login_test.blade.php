<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test OAuth SEAL</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center h-screen">
    <div class="bg-white p-8 rounded-lg shadow-md text-center max-w-sm w-full">
        <h1 class="text-2xl font-bold mb-6 text-gray-800">Login Test</h1>
        
        <a href="/api/auth/google" 
           class="flex items-center justify-center w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 mb-4">
            <img class="h-5 w-5 mr-2" src="https://www.svgrepo.com/show/475656/google-color.svg" alt="Google Logo">
            Sign in with Google
        </a>

        <div class="relative my-4">
            <div class="absolute inset-0 flex items-center">
                <div class="w-full border-t border-gray-300"></div>
            </div>
            <div class="relative flex justify-center text-sm">
                <span class="px-2 bg-white text-gray-500">Or Login Manual</span>
            </div>
        </div>

        <p class="text-xs text-gray-500 mt-4">
            *Jika berhasil, browser akan menampilkan JSON berisi Token.
        </p>
    </div>
</body>
</html>
