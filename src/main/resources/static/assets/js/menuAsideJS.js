var currentPath = window.location.pathname;

// Lặp qua tất cả các mục menu
document.querySelectorAll('.menu-item').forEach(function(item) {
    // Kiểm tra nếu href của mục menu trùng khớp với đường dẫn hiện tại
    if (item.getAttribute('href') === currentPath) {
        // Thêm lớp 'active' cho mục menu đó
        item.classList.add('active');
    }
});