/**
 * SHOPEECLONE UI-CORE MODULE (ui-core.js)
 * Cung cấp: Theme Controller (Dark/Light mode), Toast Notification System,
 * Skeleton Loading Generators, Empty State Generators và Responsive Helpers.
 */

(function (window, document) {
    'use strict';

    /* ==========================================================================
       1. THEME CONTROLLER (Dark / Light Mode)
       ========================================================================== */
    const THEME_STORAGE_KEY = 'shopee_theme';

    const ShopeeTheme = {
        getSystemTheme: function () {
            return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches
                ? 'dark'
                : 'light';
        },

        getSavedTheme: function () {
            try {
                return localStorage.getItem(THEME_STORAGE_KEY);
            } catch (e) {
                return null;
            }
        },

        getCurrentTheme: function () {
            const saved = this.getSavedTheme();
            if (saved === 'dark' || saved === 'light') {
                return saved;
            }
            return this.getSystemTheme();
        },

        applyTheme: function (theme, save) {
            if (save === undefined) save = true;
            const validTheme = theme === 'dark' ? 'dark' : 'light';

            document.documentElement.setAttribute('data-theme', validTheme);
            if (document.body) {
                document.body.setAttribute('data-theme', validTheme);
            }

            if (save) {
                try {
                    localStorage.setItem(THEME_STORAGE_KEY, validTheme);
                } catch (e) {
                    console.warn('Cannot save theme to localStorage', e);
                }
            }

            this.updateToggleButtons(validTheme);

            // Bắn event tùy biến để các view hoặc chart cập nhật nếu cần
            window.dispatchEvent(new CustomEvent('shopeeThemeChange', {
                detail: { theme: validTheme }
            }));
        },

        toggle: function () {
            const current = this.getCurrentTheme();
            const next = current === 'dark' ? 'light' : 'dark';
            this.applyTheme(next, true);
            if (window.showToast) {
                const label = next === 'dark' ? 'Đã bật Giao diện Tối' : 'Đã bật Giao diện Sáng';
                window.showToast(label, 'info', 2000);
            }
            return next;
        },

        updateToggleButtons: function (theme) {
            const buttons = document.querySelectorAll('.btn-theme-toggle, [data-theme-toggle]');
            buttons.forEach(function (btn) {
                btn.setAttribute('aria-label', theme === 'dark' ? 'Chuyển sang giao diện sáng' : 'Chuyển sang giao diện tối');
                btn.setAttribute('title', theme === 'dark' ? 'Giao diện Tối' : 'Giao diện Sáng');
                const textSpan = btn.querySelector('.theme-text');
                if (textSpan) {
                    textSpan.textContent = theme === 'dark' ? 'Chế độ tối' : 'Chế độ sáng';
                }
            });
        },

        init: function () {
            const theme = this.getCurrentTheme();
            this.applyTheme(theme, false);

            // Lắng nghe thay đổi hệ thống khi người dùng chưa chọn thủ công
            if (window.matchMedia) {
                window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
                    if (!this.getSavedTheme()) {
                        this.applyTheme(e.matches ? 'dark' : 'light', false);
                    }
                });
            }

            // Gán sự kiện click cho các nút toggle
            document.addEventListener('click', (e) => {
                const target = e.target.closest('.btn-theme-toggle, [data-theme-toggle]');
                if (target) {
                    e.preventDefault();
                    this.toggle();
                }
            });
        }
    };

    // Áp dụng theme ngay lập tức để chống giật giao diện (anti-flicker)
    ShopeeTheme.applyTheme(ShopeeTheme.getCurrentTheme(), false);

    /* ==========================================================================
       2. TOAST NOTIFICATION SYSTEM
       ========================================================================== */
    function getOrCreateToastContainer() {
        let container = document.getElementById('toast-container');
        if (!container) {
            container = document.createElement('div');
            container.id = 'toast-container';
            container.setAttribute('aria-live', 'polite');
            container.setAttribute('aria-atomic', 'true');
            document.body.appendChild(container);
        }
        return container;
    }

    const TOAST_ICONS = {
        success: 'fa-solid fa-circle-check',
        error: 'fa-solid fa-circle-xmark',
        warning: 'fa-solid fa-triangle-exclamation',
        info: 'fa-solid fa-circle-info'
    };

    const TOAST_TITLES = {
        success: 'Thành công',
        error: 'Thất bại',
        warning: 'Cảnh báo',
        info: 'Thông báo'
    };

    function showToast(message, type, duration, title) {
        if (!message) return;
        type = ['success', 'error', 'warning', 'info'].includes(type) ? type : 'info';
        duration = typeof duration === 'number' ? duration : 3500;
        title = title || TOAST_TITLES[type];

        const container = getOrCreateToastContainer();
        const toastEl = document.createElement('div');
        toastEl.className = `toast-modern toast-${type}`;
        toastEl.setAttribute('role', 'alert');

        const iconClass = TOAST_ICONS[type];

        toastEl.innerHTML = `
            <div class="toast-modern-icon">
                <i class="${iconClass}"></i>
            </div>
            <div class="toast-modern-body">
                <div class="toast-modern-title">${escapeHtml(title)}</div>
                <div class="toast-modern-message">${escapeHtml(message)}</div>
            </div>
            <button type="button" class="toast-modern-close" aria-label="Đóng">
                <i class="fa-solid fa-xmark"></i>
            </button>
            <div class="toast-modern-progress"></div>
        `;

        const progressBar = toastEl.querySelector('.toast-modern-progress');
        if (duration > 0 && progressBar) {
            progressBar.style.transition = `transform ${duration}ms linear`;
            requestAnimationFrame(() => {
                progressBar.style.transform = 'scaleX(0)';
            });
        }

        let timeoutId = null;

        function closeToast() {
            if (timeoutId) clearTimeout(timeoutId);
            toastEl.classList.add('toast-hide');
            setTimeout(() => {
                if (toastEl.parentNode) {
                    toastEl.parentNode.removeChild(toastEl);
                }
            }, 300);
        }

        const closeBtn = toastEl.querySelector('.toast-modern-close');
        if (closeBtn) {
            closeBtn.addEventListener('click', closeToast);
        }

        if (duration > 0) {
            timeoutId = setTimeout(closeToast, duration);
            toastEl.addEventListener('mouseenter', () => {
                if (timeoutId) clearTimeout(timeoutId);
                if (progressBar) progressBar.style.animationPlayState = 'paused';
            });
            toastEl.addEventListener('mouseleave', () => {
                timeoutId = setTimeout(closeToast, 1500);
            });
        }

        container.appendChild(toastEl);
        return toastEl;
    }

    function escapeHtml(str) {
        if (typeof str !== 'string') return str;
        return str
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#039;');
    }

    // Shorthand helpers
    const toast = {
        success: (msg, title, duration) => showToast(msg, 'success', duration, title),
        error: (msg, title, duration) => showToast(msg, 'error', duration, title),
        warning: (msg, title, duration) => showToast(msg, 'warning', duration, title),
        info: (msg, title, duration) => showToast(msg, 'info', duration, title)
    };

    // Bọc window.alert cũ để tự động chuyển sang toast đẹp mắt
    if (typeof window.alert === 'function') {
        window._nativeAlert = window.alert;
        window.alert = function (message) {
            showToast(message, 'info', 4000);
        };
    }

    /* ==========================================================================
       3. SKELETON & EMPTY STATE TEMPLATE GENERATORS
       ========================================================================== */
    const ShopeeUI = {
        // Tạo HTML Skeleton cho thẻ sản phẩm
        createProductSkeleton: function (count) {
            count = count || 4;
            let html = '';
            for (let i = 0; i < count; i++) {
                html += `
                    <div class="col-6 col-md-4 col-lg-3 mb-3">
                        <div class="skeleton-product-card">
                            <div class="skeleton skeleton-product-img"></div>
                            <div class="skeleton skeleton-text" style="width: 85%;"></div>
                            <div class="skeleton skeleton-text skeleton-text-sm" style="width: 55%;"></div>
                            <div class="d-flex justify-content-between align-items-center mt-2">
                                <div class="skeleton skeleton-text skeleton-text-lg" style="width: 40%; margin-bottom: 0;"></div>
                                <div class="skeleton skeleton-btn" style="width: 70px; height: 30px;"></div>
                            </div>
                        </div>
                    </div>
                `;
            }
            return html;
        },

        // Tạo HTML Skeleton cho bảng dữ liệu (Admin)
        createTableSkeleton: function (cols, rows) {
            cols = cols || 5;
            rows = rows || 5;
            let html = '';
            for (let r = 0; r < rows; r++) {
                html += '<tr class="skeleton-table-row">';
                for (let c = 0; c < cols; c++) {
                    const width = (40 + (c * 17) % 50) + '%';
                    html += `<td><div class="skeleton skeleton-text" style="width: ${width}; margin-bottom: 0;"></div></td>`;
                }
                html += '</tr>';
            }
            return html;
        },

        // Tạo HTML Skeleton cho danh sách giỏ hàng
        createCartSkeleton: function (count) {
            count = count || 3;
            let html = '';
            for (let i = 0; i < count; i++) {
                html += `
                    <div class="card-modern mb-3 p-3 d-flex flex-row align-items-center gap-3">
                        <div class="skeleton skeleton-circle" style="width: 22px; height: 22px;"></div>
                        <div class="skeleton" style="width: 80px; height: 80px; border-radius: 8px;"></div>
                        <div class="flex-grow-1">
                            <div class="skeleton skeleton-text" style="width: 60%;"></div>
                            <div class="skeleton skeleton-text skeleton-text-sm" style="width: 30%;"></div>
                        </div>
                        <div class="skeleton skeleton-text" style="width: 100px;"></div>
                        <div class="skeleton skeleton-btn" style="width: 90px; height: 34px;"></div>
                    </div>
                `;
            }
            return html;
        },

        // Tạo HTML Empty State tùy biến
        createEmptyState: function (options) {
            options = options || {};
            const icon = options.icon || 'fa-solid fa-box-open';
            const title = options.title || 'Không có dữ liệu';
            const desc = options.desc || 'Hiện chưa có mục nào để hiển thị tại đây.';
            const actionText = options.actionText || '';
            const actionLink = options.actionLink || '#';

            let actionHtml = '';
            if (actionText) {
                actionHtml = `
                    <div class="empty-state-action">
                        <a href="${actionLink}" class="btn-shopee">
                            ${escapeHtml(actionText)}
                        </a>
                    </div>
                `;
            }

            return `
                <div class="empty-state">
                    <div class="empty-state-icon">
                        <i class="${icon}"></i>
                    </div>
                    <div class="empty-state-title">${escapeHtml(title)}</div>
                    <div class="empty-state-desc">${escapeHtml(desc)}</div>
                    ${actionHtml}
                </div>
            `;
        }
    };

    /* ==========================================================================
       4. BACK TO TOP BUTTON
       ========================================================================== */
    function initBackToTop() {
        let btn = document.getElementById('back-to-top');
        if (!btn) {
            btn = document.createElement('button');
            btn.id = 'back-to-top';
            btn.setAttribute('type', 'button');
            btn.setAttribute('aria-label', 'Cuộn lên đầu trang');
            btn.setAttribute('title', 'Lên đầu trang');
            btn.innerHTML = '<i class="fa-solid fa-arrow-up"></i>';
            document.body.appendChild(btn);
        }

        window.addEventListener('scroll', () => {
            if (window.scrollY > 320) {
                btn.classList.add('show');
            } else {
                btn.classList.remove('show');
            }
        }, { passive: true });

        btn.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }

    /* ==========================================================================
       5. ADMIN SIDEBAR COLLAPSE HELPER (Mobile & Tablet)
       ========================================================================== */
    function initAdminSidebarToggle() {
        const toggleBtn = document.getElementById('admin-sidebar-toggle');
        const sidebar = document.querySelector('.admin-sidebar');
        const overlay = document.getElementById('admin-sidebar-overlay');

        if (toggleBtn && sidebar) {
            toggleBtn.addEventListener('click', () => {
                sidebar.classList.toggle('show');
                if (overlay) overlay.classList.toggle('show');
            });

            if (overlay) {
                overlay.addEventListener('click', () => {
                    sidebar.classList.remove('show');
                    overlay.classList.remove('show');
                });
            }
        }
    }

    /* ==========================================================================
       6. AUTO INIT TRÊN DOMCONTENTLOADED
       ========================================================================== */
    document.addEventListener('DOMContentLoaded', function () {
        ShopeeTheme.init();
        initBackToTop();
        initAdminSidebarToggle();
    });

    // Xuất ra global scope
    window.ShopeeTheme = ShopeeTheme;
    window.showToast = showToast;
    window.toast = toast;
    window.ShopeeUI = ShopeeUI;

})(window, document);
