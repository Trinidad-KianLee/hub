<%@ page import="com.puphub.model.Post, com.puphub.dao.PostDAO, com.puphub.model.Comment, com.puphub.dao.CommentDAO, java.util.List" %>
<%
    String category = request.getParameter("category");
    if (category == null || category.isEmpty()) {
        category = "all"; // Default category
    }

    // Fetch posts by category
    List<Post> posts = PostDAO.getPostsByCategory(category);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Posts</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.0.0/dist/full.css" rel="stylesheet">
</head>
<body class="bg-gray-900 text-white">
    <!-- Navbar -->
    <nav class="navbar bg-gray-900 text-white shadow-lg">
        <div class="flex-1">
            <a href="#" class="normal-case text-xl text-red-800 font-bold">PUPHUB</a>
        </div>
        <div class="flex-none">
            <a href="dashboard.jsp" class="btn bg-red-800 text-white hover:bg-red-600">Back to Dashboard</a>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8 space-y-8">
        <!-- Create Post Section -->
        <div class="bg-gray-800 rounded-lg p-6 shadow-lg">
            <h2 class="text-2xl font-bold mb-4">Create a New Post</h2>
            <form action="createPost" method="post" class="space-y-4">
                <div>
                    <label for="title" class="block font-bold mb-1">Title</label>
                    <input
                        type="text"
                        id="title"
                        name="title"
                        placeholder="Enter your post title"
                        class="input input-bordered w-full bg-gray-700 text-white"
                        required
                    />
                </div>
                <div>
                    <label for="content" class="block font-bold mb-1">Content</label>
                    <textarea
                        id="content"
                        name="content"
                        placeholder="Write your content here..."
                        class="textarea textarea-bordered w-full bg-gray-700 text-white"
                        rows="4"
                        required
                    ></textarea>
                </div>
                <div>
                    <label for="category" class="block font-bold mb-1">Category</label>
                    <select
                        id="category"
                        name="category"
                        class="select select-bordered w-full bg-gray-700 text-white"
                        required
                    >
                        <option value="General">General</option>
                        <option value="Announcements">Announcements</option>
                        <option value="Events">Events</option>
                        <option value="Others">Others</option>
                    </select>
                </div>
                <button type="submit" class="btn bg-red-800 text-white hover:bg-red-600">Submit Post</button>
            </form>
        </div>

        <!-- Filter Section -->
        <div class="bg-gray-800 rounded-lg p-6 shadow-lg">
            <h2 class="text-2xl font-bold mb-4">Filter by Category</h2>
            <div class="dropdown">
                <label tabindex="0" class="btn bg-red-800 text-white hover:bg-red-600">Categories</label>
                <ul tabindex="0" class="dropdown-content menu p-2 shadow bg-gray-700 rounded-box w-52 text-white">
                    <li><a href="posts.jsp?category=all">All</a></li>
                    <li><a href="posts.jsp?category=General">General</a></li>
                    <li><a href="posts.jsp?category=Announcements">Announcements</a></li>
                    <li><a href="posts.jsp?category=Events">Events</a></li>
                    <li><a href="posts.jsp?category=Others">Others</a></li>
                </ul>
            </div>
        </div>

        <!-- Posts Section -->
        <div class="space-y-4">
            <h2 class="text-3xl font-bold">Posts in Category: <%= category %></h2>
            <% if (posts.isEmpty()) { %>
                <div class="bg-yellow-100 text-yellow-800 p-4 rounded-lg shadow-md">
                    No posts found in this category.
                </div>
            <% } else { %>
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    <% for (Post post : posts) { %>
                        <div class="bg-gray-800 rounded-lg shadow-md p-6">
                            <h3 class="text-xl font-bold text-red-600 mb-2">Category: <%= post.getCategory() %></h3>
                            <p class="text-lg font-semibold mb-2">Title: <%= post.getTitle() %></p>
                            <p class="text-gray-300 mb-4">Content: <%= post.getContent() %></p>
                            <p class="text-sm text-gray-500">Time Posted: <%= post.getTimestamp() %></p>
                            <hr class="my-4">
                            <p class="text-sm"><strong>Posted By:</strong> <%= post.getFirstName() %> <%= post.getLastName() %></p>
                            <p class="text-sm"><strong>PUP Branch:</strong> <%= post.getPupBranch() %></p>

                            <!-- Comments Section -->
                            <div class="mt-6">
                                <h3 class="text-xl font-bold mb-4">Comments</h3>
                                <% List<Comment> comments = CommentDAO.getCommentsByPostId(post.getId()); %>
                                <% if (comments.isEmpty()) { %>
                                    <div class="text-gray-500">No comments yet.</div>
                                <% } else { %>
                                    <div class="space-y-2">
                                        <% for (Comment comment : comments) { %>
                                            <div class="bg-gray-700 rounded-lg p-4">
                                                <p><strong><%= comment.getFirstName() %> <%= comment.getLastName() %>:</strong> <%= comment.getContent() %></p>
                                                <p class="text-gray-500 text-sm"><%= comment.getTimeCreated() %></p>
                                            </div>
                                        <% } %>
                                    </div>
                                <% } %>
                            </div>

                            <!-- Add Comment Form -->
                            <form action="addComment" method="post" class="mt-4">
                                <input type="hidden" name="postId" value="<%= post.getId() %>" />
                                <textarea
                                    name="content"
                                    placeholder="Add a comment..."
                                    class="textarea textarea-bordered w-full bg-gray-700 text-white"
                                    rows="2"
                                    required
                                ></textarea>
                                <button type="submit" class="btn bg-red-800 text-white hover:bg-red-600 mt-2">Submit Comment</button>
                            </form>
                        </div>
                    <% } %>
                </div>
            <% } %>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-gray-800 text-gray-400 text-center py-4">
        <p class="text-sm">© 2025 PUP Hub. All rights reserved.</p>
    </footer>
</body>
</html>
