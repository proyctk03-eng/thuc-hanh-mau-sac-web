// =============================================================================
// DỰ ÁN: PHÁT TRIỂN TRANG WEB XEM HOẠT HÌNH TRỰC TUYẾN
// Tệp: app.js
// Xử lý: Đổi video, Chuyển đổi chế độ HTML5 <video> / YouTube <iframe>, Tìm kiếm & Lọc
// =============================================================================

// Danh sách dữ liệu video mẫu chất lượng cao
const videosData = [
    {
        id: 0,
        title: "Doraemon: Chú Mèo Máy Đến Từ Tương Lai (Tập 1 - Thuyết Minh)",
        category: "3d",
        views: 152000,
        date: "2026-10-09",
        duration: "12:45",
        poster: "https://images.unsplash.com/photo-1534447677768-be436bb09401?w=1000&auto=format&fit=crop&q=80",
        videoSrc: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        youtubeId: "aqz-KE-bpKQ", // Big Buck Bunny animated sample
        desc: "Chú mèo máy Doraemon đến từ thế kỷ 22 với chiếc túi thần kỳ chứa hàng trăm bảo bối độc đáo, đồng hành cùng cậu bé Nobita vụng về nhưng giàu lòng nhân ái. Bộ phim mang thông điệp giáo dục sâu sắc về tình bạn, lòng dũng cảm và tinh thần tự lập dành cho trẻ nhỏ."
    },
    {
        id: 1,
        title: "Tom & Jerry: Trận Chiến Phô Mai Vui Nhộn (FullHD)",
        category: "3d",
        views: 240000,
        date: "2026-10-08",
        duration: "09:30",
        poster: "https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=1000&auto=format&fit=crop&q=80",
        videoSrc: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        youtubeId: "TLkA0RELQ1g", // Animated sample
        desc: "Cuộc rượt đuổi không hồi kết giữa chú mèo Tom tinh quái và chú chuột Jerry thông minh lém lỉnh. Những tình huống hài hước vui nhộn mang lại tiếng cười sảng khoái và phát triển tư duy phán đoán cho các bé."
    },
    {
        id: 2,
        title: "Cổ Tích Việt Nam: Cây Tre Trăm Đốt (Audio Thuyết Minh)",
        category: "cotich",
        views: 98000,
        date: "2026-10-05",
        duration: "15:10",
        poster: "https://images.unsplash.com/photo-1509198397868-475647b2a1e5?w=1000&auto=format&fit=crop&q=80",
        videoSrc: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        youtubeId: "YE7VzlLtp-4",
        desc: "Câu chuyện cổ tích dân gian dạy cho trẻ bài học về đức tính thật thà, chăm chỉ, và sự công bằng trong cuộc sống. Chàng Khoai hiền lành được ông Bụt ban cho câu thần chú kỳ diệu 'Khắc nhập, khắc xuất'."
    },
    {
        id: 3,
        title: "Chú Thỏ Khổng Lồ: Big Buck Bunny 3D (Bản Đẹp 1080p)",
        category: "3d",
        views: 185000,
        date: "2026-10-07",
        duration: "10:34",
        poster: "https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?w=1000&auto=format&fit=crop&q=80",
        videoSrc: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        youtubeId: "aqz-KE-bpKQ",
        desc: "Phim hoạt hình 3D vui nhộn về chú thỏ khổng lồ hiền lành sống trong khu rừng yên bình, dạy bài học về bảo vệ thiên nhiên và tình yêu thương động vật hoang dã."
    },
    {
        id: 4,
        title: "Sự Tích Quả Dưa Hấu: Mai An Tiêm và Bài Học Tự Lập",
        category: "cotich",
        views: 110000,
        date: "2026-10-04",
        duration: "11:20",
        poster: "https://images.unsplash.com/photo-1563089145-599997674d42?w=1000&auto=format&fit=crop&q=80",
        videoSrc: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
        youtubeId: "TLkA0RELQ1g",
        desc: "Bản lĩnh kiên cường và ý chí tự lực cánh sinh của Mai An Tiêm khi bị đày ra đảo hoang, giúp trẻ hiểu được giá trị của lao động và tinh thần không bao giờ bỏ cuộc."
    }
];

let currentIndex = 0;
let currentMode = "html5"; // "html5" hoặc "youtube"

// 1. Hàm chọn video từ danh sách bên trái để phát ở bên phải
function selectVideo(index, itemElement) {
    currentIndex = index;
    const video = videosData[index];

    // Cập nhật trạng thái active trên danh sách
    document.querySelectorAll('.video-item').forEach(el => el.classList.remove('active'));
    if (itemElement) {
        itemElement.classList.add('active');
    }

    // Cập nhật thông tin chi tiết
    document.getElementById('currentVideoTitle').innerText = video.title;
    document.getElementById('currentVideoDesc').innerText = video.desc;

    // Cập nhật HTML5 <video> player
    const videoPlayer = document.getElementById('mainVideoPlayer');
    const videoSource = document.getElementById('videoSource');
    videoPlayer.poster = video.poster;
    videoSource.src = video.videoSrc;
    videoPlayer.load();

    // Cập nhật YouTube <iframe> player
    const youtubeIframe = document.getElementById('mainYoutubeIframe');
    youtubeIframe.src = `https://www.youtube.com/embed/${video.youtubeId}?rel=0`;

    // Cuộn nhẹ lên trình phát nếu trên màn hình di động
    if (window.innerWidth <= 1024) {
        document.querySelector('.right-content').scrollIntoView({ behavior: 'smooth' });
    }
}

// 2. Hàm chuyển đổi chế độ phát: Thẻ HTML5 <video> vs Nhúng YouTube <iframe>
function switchPlayerMode(mode) {
    currentMode = mode;
    const html5Wrapper = document.getElementById('html5PlayerWrapper');
    const youtubeWrapper = document.getElementById('youtubePlayerWrapper');
    const btnHtml5 = document.getElementById('btnHtml5Video');
    const btnYoutube = document.getElementById('btnYoutubeIframe');
    const videoPlayer = document.getElementById('mainVideoPlayer');

    if (mode === 'html5') {
        html5Wrapper.style.display = 'block';
        youtubeWrapper.style.display = 'none';
        btnHtml5.classList.add('active');
        btnYoutube.classList.remove('active');
    } else {
        html5Wrapper.style.display = 'none';
        youtubeWrapper.style.display = 'block';
        btnHtml5.classList.remove('active');
        btnYoutube.classList.add('active');
        // Tạm dừng HTML5 video khi chuyển sang xem YouTube
        videoPlayer.pause();
    }
}

// 3. Hàm tìm kiếm phim hoạt hình theo tên (Live Search)
function filterVideos() {
    const query = document.getElementById('searchInput').value.toLowerCase().trim();
    const items = document.querySelectorAll('.video-list .video-item');
    let visibleCount = 0;

    items.forEach((item, idx) => {
        const title = videosData[idx].title.toLowerCase();
        if (title.includes(query)) {
            item.style.display = 'flex';
            visibleCount++;
        } else {
            item.style.display = 'none';
        }
    });

    document.getElementById('videoCount').innerText = `${visibleCount} Phim`;
}

// 4. Lọc theo danh mục
function filterCategory(cat, btn) {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    btn.classList.add('active');

    const items = document.querySelectorAll('.video-list .video-item');
    let visibleCount = 0;

    items.forEach((item, idx) => {
        const itemCat = videosData[idx].category;
        if (cat === 'all' || itemCat === cat) {
            item.style.display = 'flex';
            visibleCount++;
        } else {
            item.style.display = 'none';
        }
    });

    document.getElementById('videoCount').innerText = `${visibleCount} Phim`;
}

// 5. Sắp xếp theo tiêu chí: Mới nhất hoặc Xem nhiều nhất
function sortVideos(criteria) {
    let sortedList = [...videosData];
    if (criteria === 'popular') {
        sortedList.sort((a, b) => b.views - a.views);
    } else if (criteria === 'newest') {
        sortedList.sort((a, b) => new Date(b.date) - new Date(a.date));
    }

    renderVideoList(sortedList);
}

// Hàm render lại danh sách sau khi sắp xếp
function renderVideoList(list) {
    const listEl = document.getElementById('videoList');
    listEl.innerHTML = '';

    list.forEach((video, index) => {
        const isActive = video.id === currentIndex ? 'active' : '';
        const li = document.createElement('li');
        li.className = `video-item ${isActive}`;
        li.onclick = () => selectVideo(video.id, li);
        li.innerHTML = `
            <div class="thumb-box">
                <img src="${video.poster}" alt="${video.title}">
                <span class="duration-tag">${video.duration}</span>
            </div>
            <div class="video-info">
                <h4 class="video-title">${video.title}</h4>
                <div class="video-meta">
                    <span class="tag-badge ${video.category === 'cotich' ? 'badge-vn' : 'badge-hd'}">${video.category === 'cotich' ? 'Cổ Tích' : 'FullHD'}</span>
                    <span class="views">👁️ ${(video.views / 1000).toFixed(0)}k lượt xem</span>
                </div>
            </div>
        `;
        listEl.appendChild(li);
    });

    document.getElementById('videoCount').innerText = `${list.length} Phim`;
}
