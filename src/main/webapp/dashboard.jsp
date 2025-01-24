<%@ page import="com.puphub.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PUP-HUB Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/daisyui@3.0.0/dist/full.css">
</head>
<body class="bg-gray-100 text-gray-800">
    <!-- Navbar -->
  <nav class="navbar bg-base-300 shadow-lg">
    <div class="flex-1">
        <a href="#" class="btn btn-ghost normal-case text-xl text-red-800">PUPHUB</a>
    </div>
    <div class="flex-none flex items-center">
        <!-- Dropdown for Categories -->
      <div class="dropdown dropdown-hover mr-4">
    <label tabindex="0" class="btn bg-red-800 text-white hover:bg-red-600">Categories</label>
    <ul tabindex="0" class="dropdown-content menu p-2 shadow bg-base-100 rounded-box w-52">
        <li><a href="posts.jsp?category=General">General</a></li>
        <li><a href="posts.jsp?category=Announcements">Announcements</a></li>
        <li><a href="posts.jsp?category=Events">Events</a></li>
        <li><a href="posts.jsp?category=Others">Others</a></li>
    </ul>
</div>

        <!-- Logout Button -->
        <a href="login.jsp" class="btn bg-red-800 text-white hover:bg-red-600">Logout</a>
    </div>
</nav>

    <!-- Main Content -->
    <section class="min-h-screen py-10 px-4 flex flex-col items-center">
        <!-- Heading -->
        <div class="text-center mb-10">
            <h1 class="text-5xl font-bold text-gray-800">Welcome, <%= user.getFirstName() %>!</h1>
            <p class="py-4 text-gray-600">Explore topics, create posts, and engage with the PUP Hub community!</p>
        </div>

        <!-- Categories -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 w-full max-w-5xl">
            <!-- General -->
            <a href="category?name=General" class="card bg-red-800 text-white shadow-lg hover:bg-red-600 p-6 rounded-lg">
                <h3 class="text-2xl font-bold">General</h3>
                <p class="text-sm">Discuss anything and everything here.</p>
            </a>
            <!-- Announcements -->
            <a href="category?name=Announcements" class="card bg-red-800 text-white shadow-lg hover:bg-red-600 p-6 rounded-lg">
                <h3 class="text-2xl font-bold">Announcements</h3>
                <p class="text-sm">Stay updated with the latest news and announcements.</p>
            </a>
            <!-- Events -->
            <a href="category?name=Events" class="card bg-red-800 text-white shadow-lg hover:bg-red-600 p-6 rounded-lg">
                <h3 class="text-2xl font-bold">Events</h3>
                <p class="text-sm">Find and discuss upcoming events.</p>
            </a>
            <!-- Others -->
            <a href="category?name=Others" class="card bg-red-800 text-white shadow-lg hover:bg-red-600 p-6 rounded-lg">
                <h3 class="text-2xl font-bold">Others</h3>
                <p class="text-sm">Miscellaneous topics and discussions.</p>
            </a>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-base-300 text-gray-700 py-6">
        <div class="text-center">
            <p>&copy; 2025 PUP Hub. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
