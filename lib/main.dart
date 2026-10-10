<!DOCTYPE html>
<html lang="ar" dir="rtl" class="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="theme-color" content="#0A0A0A">
    <title>قبلتي - البوصلة الذكية</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    colors: {
                        darkBg: '#0A0A0A', // أسود عميق مطابق للصورة
                        cardBg: '#141414',
                        borderBg: '#262626',
                    },
                    fontFamily: {
                        ruqaa: ['"Aref Ruqaa"', 'serif'],
                        sans: ['Tajawal', 'sans-serif'],
                    }
                }
            }
        }
    </script>

    <!-- خطوط جوجل -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Aref+Ruqaa:wght@400;700&family=Tajawal:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- أيقونات FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            font-family: 'Tajawal', sans-serif;
            background-color: #0A0A0A;
            color: #FFFFFF;
            user-select: none;
            overflow: hidden;
            -webkit-tap-highlight-color: transparent;
        }

        .font-ruqaa { font-family: 'Aref Ruqaa', serif; }

        /* تأثيرات التوهج */
        .qibla-glow {
            box-shadow: 0 0 40px rgba(255, 255, 255, 0.15);
            border-color: rgba(255, 255, 255, 0.8) !important;
        }

        /* حركة البوصلة */
        .compass-dial {
            transition: transform 0.15s cubic-bezier(0.1, 0.9, 0.2, 1);
        }

        /* شريط التمرير */
        ::-webkit-scrollbar { width: 4px; }
        ::-webkit-scrollbar-track { background: #0A0A0A; }
        ::-webkit-scrollbar-thumb { background: #333; border-radius: 2px; }

        /* أنيميشن شاشة التحميل */
        @keyframes breathing {
            0%, 100% { transform: scale(1); opacity: 0.9; }
            50% { transform: scale(1.02); opacity: 1; }
        }
        .animate-breathing { animation: breathing 3s infinite ease-in-out; }

        /* حركة الرقم 8 للمعايرة */
        @keyframes figure8 {
            0% { transform: translate(0, 0); }
            25% { transform: translate(15px, -8px); }
            50% { transform: translate(0, 0); }
            75% { transform: translate(-15px, 8px); }
            100% { transform: translate(0, 0); }
        }
        .animate-figure8 { animation: figure8 3s infinite ease-in-out; }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between antialiased selection:bg-zinc-800">

    <!-- ========================================== -->
    <!-- 1. شاشة الدخول (Splash Screen) المدمجة والمحسنة -->
    <!-- ========================================== -->
    <div id="splash-screen" class="fixed inset-0 z-50 flex flex-col items-center justify-between bg-darkBg transition-opacity duration-1000">
        
        <!-- الجزء العلوي: الشعار المتكامل -->
        <div class="flex-1 flex flex-col items-center justify-center w-full max-w-md px-6">
            
            <!-- حاوية الشعار (الصورة + النص) -->
            <div class="relative flex flex-col items-center animate-breathing">
                
                <!-- رسمة السجود (SVG عالي الدقة مطابق للصورة) -->
                <div class="relative w-64 h-64 mb-2">
                    <!-- الظل الأرضي -->
                    <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-48 h-12 bg-zinc-900/80 rounded-full blur-xl"></div>
                    
                    <svg class="w-full h-full text-white relative z-10 drop-shadow-2xl" viewBox="0 0 500 500" fill="none">
                        <!-- خطوط الملابس البيضاء العريضة (مستوحاة من الصورة) -->
                        <path d="M 160 240 C 200 170, 290 170, 340 230 C 370 260, 390 310, 370 350 C 350 370, 310 360, 280 330 C 250 300, 230 270, 200 280 C 170 290, 140 330, 110 350 C 90 360, 80 340, 100 310 C 120 280, 150 270, 160 240 Z" fill="#FFFFFF"/>
                        
                        <!-- الرأس والعمامة -->
                        <path d="M 350 310 C 370 290, 410 300, 420 330 C 430 360, 400 380, 370 370 C 340 360, 330 330, 350 310 Z" fill="#FFFFFF"/>
                        
                        <!-- اليدين الممدوتين للسجود -->
                        <path d="M 220 320 C 250 310, 280 330, 290 350 C 300 370, 270 390, 240 380 C 210 370, 200 340, 220 320 Z" fill="#FFFFFF"/>
                        
                        <!-- خطوط الثنيات على الظهر -->
                        <path d="M 230 230 C 260 220, 300 240, 320 270" stroke="#0A0A0A" stroke-width="5" stroke-linecap="round"/>
                        <path d="M 210 260 C 240 250, 270 270, 290 300" stroke="#0A0A0A" stroke-width="5" stroke-linecap="round"/>
                        
                        <!-- خطوط الملابس السفلية -->
                        <path d="M 110 350 C 140 360, 190 370, 240 370 C 270 370, 290 360, 310 350" stroke="#FFFFFF" stroke-width="8" stroke-linecap="round"/>
                    </svg>
                </div>

                <!-- اسم التطبيق بخط الرقعة (مدمج تحت الرسمة مباشرة) -->
                <h1 class="text-6xl font-ruqaa text-white mt-4 drop-shadow-md z-20">قبلتي</h1>
                <p class="text-[10px] text-zinc-500 font-light tracking-[0.3em] mt-2 uppercase z-20">Qibla Compass</p>
            </div>

            <!-- شريط التحميل الأنيق -->
            <div class="w-full max-w-[200px] mt-12 flex flex-col items-center gap-3">
                <div class="w-full h-0.5 bg-zinc-800 rounded-full overflow-hidden">
                    <div id="splash-progress-bar" class="h-full bg-white w-0 transition-all duration-500 ease-out"></div>
                </div>
                <span id="splash-status-text" class="text-[10px] text-zinc-500 font-medium tracking-wider">جاري التهيئة...</span>
            </div>
        </div>

        <!-- الجزء السفلي: حقوق الملكية -->
        <div class="pb-8 text-center">
            <p class="text-[10px] text-zinc-700 font-light">إصدار احترافي متكامل • يعمل بالمستشعرات الحقيقية</p>
        </div>
    </div>

    <!-- ========================================== -->
    <!-- 2. الواجهة الرئيسية (Main App) -->
    <!-- ========================================== -->
    <div id="main-app" class="hidden h-full flex-col">
        
        <!-- الشريط العلوي -->
        <header class="fixed top-0 w-full z-30 bg-darkBg/90 backdrop-blur-md border-b border-zinc-800/80 px-4 py-3">
            <div class="max-w-md mx-auto flex items-center justify-between">
                <div class="flex items-center gap-3">
                    <div class="w-9 h-9 rounded-xl bg-zinc-900 border border-zinc-700/60 flex items-center justify-center text-white font-ruqaa text-2xl">
                        ق
                    </div>
                    <div>
                        <h2 class="text-xl font-ruqaa text-white leading-tight">قبلتي</h2>
                        <p id="header-location" class="text-[10px] text-zinc-400 flex items-center gap-1">
                            <i class="fa-solid fa-location-dot text-zinc-500 text-[9px]"></i> جاري تحديد الموقع...
                        </p>
                    </div>
                </div>

                <div class="flex items-center gap-2">
                    <!-- زر الصوت -->
                    <button id="btn-sound-toggle" onclick="toggleAudio()" class="w-9 h-9 rounded-xl bg-zinc-900 border border-zinc-800 flex items-center justify-center text-zinc-300 transition hover:border-zinc-600">
                        <i id="sound-icon" class="fa-solid fa-volume-high text-xs"></i>
                    </button>
                    <!-- زر الاستفهام (المعايرة) -->
                    <button onclick="openModal('calibration-modal')" class="w-9 h-9 rounded-xl bg-zinc-900 border border-zinc-800 flex items-center justify-center text-white transition hover:border-zinc-600">
                        <i class="fa-solid fa-circle-question text-sm"></i>
                    </button>
                </div>
            </div>
        </header>

        <!-- المحتوى الرئيسي -->
        <main class="flex-1 max-w-md w-full mx-auto p-4 flex flex-col justify-center items-center gap-6 mt-16 overflow-y-auto pb-24">
            
            <!-- حالة القبلة -->
            <div class="text-center">
                <div id="qibla-badge" class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-zinc-900 border border-zinc-800 text-xs font-medium text-zinc-300 mb-2 transition-all duration-300">
                    <span id="qibla-status-dot" class="w-2 h-2 rounded-full bg-amber-500 animate-pulse"></span>
                    <span id="qibla-status-text">قم بتدوير الهاتف نحو القبلة</span>
                </div>
                <h3 class="text-4xl font-bold tracking-tight text-white flex items-center justify-center gap-1">
                    <span id="heading-degrees">0</span>°
                </h3>
                <p class="text-xs text-zinc-400 mt-1">زاوية القبلة: <span id="qibla-angle-target" class="text-white font-bold">--°</span></p>
            </div>

            <!-- البوصلة التفاعلية -->
            <div class="relative w-80 h-80 flex items-center justify-center">
                <div class="absolute inset-0 rounded-full border border-zinc-800/80 bg-zinc-950/50 shadow-2xl"></div>
                <div class="absolute inset-3 rounded-full border border-zinc-800/40"></div>
                <div id="glow-ring" class="absolute inset-0 rounded-full transition-all duration-500"></div>

                <!-- مؤشر الهاتف الثابت -->
                <div class="absolute top-0 left-1/2 -translate-x-1/2 -translate-y-2 z-20 flex flex-col items-center">
                    <div class="w-3 h-3 bg-white rotate-45 rounded-sm shadow-md"></div>
                </div>

                <!-- القرص الدوار -->
                <div id="compass-dial" class="compass-dial relative w-full h-full rounded-full flex items-center justify-center">
                    <svg class="absolute inset-0 w-full h-full text-zinc-700" viewBox="0 0 200 200">
                        <circle cx="100" cy="100" r="94" fill="none" stroke="currentColor" stroke-width="1" stroke-dasharray="1 7" />
                        <circle cx="100" cy="100" r="86" fill="none" stroke="currentColor" stroke-width="0.5" stroke-dasharray="2 12" />
                    </svg>

                    <span class="absolute top-5 text-xs font-bold text-white">شمال</span>
                    <span class="absolute right-5 text-xs font-bold text-zinc-400">شرق</span>
                    <span class="absolute bottom-5 text-xs font-bold text-zinc-400">جنوب</span>
                    <span class="absolute left-5 text-xs font-bold text-zinc-400">غرب</span>

                    <!-- مؤشر القبلة -->
                    <div id="qibla-pointer" class="absolute inset-0 flex flex-col items-center justify-start pt-2 transition-transform duration-200" style="transform: rotate(0deg);">
                        <div class="relative flex flex-col items-center">
                            <div class="w-10 h-10 bg-black border-2 border-white rounded-lg shadow-lg flex flex-col items-center justify-center relative overflow-hidden">
                                <div class="w-full h-2 bg-white top-1.5 absolute"></div>
                                <i class="fa-solid fa-kaaba text-white text-lg mt-1"></i>
                            </div>
                            <div class="w-0.5 h-24 bg-gradient-to-b from-white via-white/50 to-transparent"></div>
                        </div>
                    </div>

                    <!-- مركز البوصلة -->
                    <div class="w-24 h-24 rounded-full bg-zinc-900 border border-zinc-700/80 flex flex-col items-center justify-center shadow-inner text-center p-2 z-10">
                        <span class="font-ruqaa text-2xl text-white">الكعبة</span>
                        <span id="kaba-distance" class="text-[9px] text-zinc-400 mt-1">-- كم</span>
                    </div>
                </div>
            </div>

            <!-- محاكي الدوران (يظهر فقط إذا لم تتوفر مستشعرات) -->
            <div id="simulator-container" class="w-full max-w-xs mt-2 p-3 rounded-2xl bg-zinc-900/60 border border-zinc-800/80 hidden">
                <div class="flex justify-between items-center text-xs text-zinc-400 mb-2">
                    <span><i class="fa-solid fa-hand-pointer text-zinc-500 ml-1"></i> محاكي البوصلة (للتجربة)</span>
                    <span id="sim-angle-text" class="text-white font-mono">0°</span>
                </div>
                <input type="range" id="gyro-simulator" min="0" max="360" value="0" oninput="simulateRotation(this.value)" class="w-full h-1.5 bg-zinc-800 rounded-lg appearance-none cursor-pointer accent-white">
            </div>
        </main>

        <!-- الأزرار السفلية -->
        <footer class="fixed bottom-0 w-full bg-darkBg/90 backdrop-blur-md border-t border-zinc-800/80 p-4">
            <div class="max-w-md mx-auto flex justify-around">
                <button onclick="openModal('widget-modal')" class="flex flex-col items-center gap-1 text-zinc-400 hover:text-white transition">
                    <i class="fa-solid fa-widget text-lg"></i>
                    <span class="text-[10px]">الودجت</span>
                </button>
                <button onclick="openModal('notifications-modal')" class="flex flex-col items-center gap-1 text-zinc-400 hover:text-white transition">
                    <i class="fa-solid fa-bell text-lg"></i>
                    <span class="text-[10px]">الإشعارات</span>
                </button>
                <button onclick="openModal('android-modal')" class="flex flex-col items-center gap-1 text-zinc-400 hover:text-white transition">
                    <i class="fa-brands fa-android text-lg"></i>
                    <span class="text-[10px]">أذونات أندرويد</span>
                </button>
            </div>
        </footer>
    </div>

    <!-- ========================================== -->
    <!-- 3. النوافذ المنبثقة (Modals) -->
    <!-- ========================================== -->

    <!-- نافذة المعايرة -->
    <div id="calibration-modal" class="fixed inset-0 z-50 bg-black/90 backdrop-blur-sm hidden flex items-center justify-center p-4">
        <div class="bg-zinc-900 border border-zinc-800 w-full max-w-md rounded-3xl p-6 shadow-2xl relative">
            <button onclick="closeModal('calibration-modal')" class="absolute top-4 left-4 w-8 h-8 rounded-full bg-zinc-800 text-zinc-400 hover:text-white flex items-center justify-center">
                <i class="fa-solid fa-xmark text-sm"></i>
            </button>
            <div class="text-center mb-6">
                <h3 class="text-xl font-bold text-white font-ruqaa">كيفية معايرة البوصلة</h3>
                <p class="text-xs text-zinc-400 mt-1">للحصول على أدق اتجاه للقبلة</p>
            </div>
            <div class="space-y-4">
                <div class="bg-zinc-950 p-4 rounded-2xl border border-zinc-800 text-center">
                    <div class="w-16 h-16 mx-auto bg-zinc-900 rounded-full flex items-center justify-center mb-3 relative overflow-hidden">
                        <div class="w-4 h-4 bg-white rounded-full animate-figure8"></div>
                    </div>
                    <h4 class="text-sm font-bold text-white mb-1">1. حرك الهاتف على شكل رقم 8</h4>
                    <p class="text-[11px] text-zinc-400">قم بتدوير الهاتف في الهواء برسم رقم 8 بالإنجليزية لثوانٍ معدودة.</p>
                </div>
                <div class="bg-zinc-950 p-4 rounded-2xl border border-zinc-800 text-center">
                    <div class="w-16 h-16 mx-auto bg-zinc-900 rounded-full flex items-center justify-center mb-3">
                        <i class="fa-solid fa-magnet text-2xl text-zinc-500"></i>
                    </div>
                    <h4 class="text-sm font-bold text-white mb-1">2. ابتعد عن المعادن</h4>
                    <p class="text-[11px] text-zinc-400">تأكد من عدم وجود أغطية مغناطيسية أو أجهزة إلكترونية قريبة تؤثر على الدقة.</p>
                </div>
            </div>
            <button onclick="closeModal('calibration-modal'); playSound('click');" class="w-full mt-6 py-3 rounded-xl bg-white text-black font-bold text-sm transition hover:bg-zinc-200">
                فهمت، شكراً
            </button>
        </div>
    </div>

    <!-- نافذة الودجت -->
    <div id="widget-modal" class="fixed inset-0 z-50 bg-black/90 backdrop-blur-sm hidden flex items-center justify-center p-4">
        <div class="bg-zinc-900 border border-zinc-800 w-full max-w-md rounded-3xl p-6 shadow-2xl relative">
            <button onclick="closeModal('widget-modal')" class="absolute top-4 left-4 w-8 h-8 rounded-full bg-zinc-800 text-zinc-400 hover:text-white flex items-center justify-center">
                <i class="fa-solid fa-xmark text-sm"></i>
            </button>
            <h3 class="text-lg font-bold text-white mb-4 text-center">ودجت الشاشة الرئيسية</h3>
            <div class="bg-gradient-to-br from-zinc-950 to-zinc-900 border border-zinc-800 rounded-2xl p-4 shadow-xl flex items-center justify-between">
                <div class="flex items-center gap-3">
                    <div class="relative w-14 h-14 rounded-full bg-zinc-900 border border-zinc-700 flex items-center justify-center">
                        <div id="widget-arrow" class="w-full h-full flex items-center justify-center transition-transform duration-300" style="transform: rotate(0deg);">
                            <i class="fa-solid fa-location-arrow text-white text-xl transform -rotate-45"></i>
                        </div>
                    </div>
                    <div>
                        <div class="text-xs font-bold text-white font-ruqaa text-base">قبلتي</div>
                        <div id="widget-status" class="text-[11px] text-zinc-400 font-medium">جاري التحديد...</div>
                    </div>
                </div>
                <button onclick="triggerNotification('تم تفعيل ودجت قبلتي بنجاح!')" class="px-3 py-1.5 rounded-xl bg-zinc-800 hover:bg-zinc-700 border border-zinc-700 text-xs text-white transition">
                    إضافة
                </button>
            </div>
            <p class="text-[10px] text-zinc-500 text-center mt-3">يعرض الودجت الاتجاه مباشرة دون الحاجة لفتح التطبيق.</p>
        </div>
    </div>

    <!-- نافذة الإشعارات -->
    <div id="notifications-modal" class="fixed inset-0 z-50 bg-black/90 backdrop-blur-sm hidden flex items-center justify-center p-4">
        <div class="bg-zinc-900 border border-zinc-800 w-full max-w-md rounded-3xl p-6 shadow-2xl relative">
            <button onclick="closeModal('notifications-modal')" class="absolute top-4 left-4 w-8 h-8 rounded-full bg-zinc-800 text-zinc-400 hover:text-white flex items-center justify-center">
                <i class="fa-solid fa-xmark text-sm"></i>
            </button>
            <h3 class="text-lg font-bold text-white mb-2 text-center">إشعارات التذكير الذكية</h3>
            <p class="text-xs text-zinc-400 text-center mb-4">تنبيهات خفيفة لتذكيرك باستخدام البوصلة عند الحاجة.</p>
            <div class="space-y-3">
                <button onclick="sendSampleNotification('remember')" class="w-full p-3 rounded-xl bg-zinc-950 border border-zinc-800 hover:border-zinc-600 text-right transition flex items-center justify-between">
                    <div>
                        <div class="text-xs font-bold text-white">تذكير البوصلة</div>
                        <div class="text-[10px] text-zinc-500 mt-1">"هل أنت في مكان جديد؟ حدد قبلتك الآن"</div>
                    </div>
                    <i class="fa-solid fa-compass text-white"></i>
                </button>
                <button onclick="sendSampleNotification('prayer')" class="w-full p-3 rounded-xl bg-zinc-950 border border-zinc-800 hover:border-zinc-600 text-right transition flex items-center justify-between">
                    <div>
                        <div class="text-xs font-bold text-white">تذكير الصلاة</div>
                        <div class="text-[10px] text-zinc-500 mt-1">"اقترب وقت الصلاة، استعد للقبلة"</div>
                    </div>
                    <i class="fa-solid fa-kaaba text-white"></i>
                </button>
            </div>
        </div>
    </div>

    <!-- نافذة أذونات أندرويد -->
    <div id="android-modal" class="fixed inset-0 z-50 bg-black/90 backdrop-blur-sm hidden flex items-center justify-center p-4">
        <div class="bg-zinc-900 border border-zinc-800 w-full max-w-md rounded-3xl p-6 shadow-2xl relative max-h-[90vh] flex flex-col">
            <button onclick="closeModal('android-modal')" class="absolute top-4 left-4 w-8 h-8 rounded-full bg-zinc-800 text-zinc-400 hover:text-white flex items-center justify-center">
                <i class="fa-solid fa-xmark text-sm"></i>
            </button>
            <div class="text-center mb-4">
                <i class="fa-brands fa-android text-3xl text-white mb-2"></i>
                <h3 class="text-lg font-bold text-white">أذونات تطبيق أندرويد</h3>
                <p class="text-xs text-zinc-400">مطلوبة ليعمل التطبيق بكفاءة عند تحويله لـ APK</p>
            </div>
            <div class="overflow-y-auto space-y-3 text-xs mb-4">
                <div class="bg-zinc-950 p-3 rounded-xl border border-zinc-800 flex justify-between items-center">
                    <span class="text-zinc-300"><i class="fa-solid fa-location-crosshairs text-zinc-500 ml-2"></i> الموقع الدقيق (GPS)</span>
                    <span class="px-2 py-0.5 rounded bg-zinc-800 text-white border border-zinc-700 text-[10px]">مطلوب</span>
                </div>
                <div class="bg-zinc-950 p-3 rounded-xl border border-zinc-800 flex justify-between items-center">
                    <span class="text-zinc-300"><i class="fa-solid fa-compass text-zinc-500 ml-2"></i> مستشعر البوصلة</span>
                    <span class="px-2 py-0.5 rounded bg-zinc-800 text-white border border-zinc-700 text-[10px]">مطلوب</span>
                </div>
                <div class="bg-zinc-950 p-3 rounded-xl border border-zinc-800 flex justify-between items-center">
                    <span class="text-zinc-300"><i class="fa-solid fa-bell text-zinc-500 ml-2"></i> إشعارات الخلفية</span>
                    <span class="px-2 py-0.5 rounded bg-zinc-800 text-white border border-zinc-700 text-[10px]">مطلوب</span>
                </div>
            </div>
            <div class="bg-zinc-950 p-3 rounded-xl border border-zinc-800 overflow-x-auto dir-ltr text-left mb-4">
                <pre class="text-[9px] text-zinc-400 font-mono leading-relaxed">
&lt;uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" /&gt;
&lt;uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" /&gt;
&lt;uses-permission android:name="android.permission.HIGH_SAMPLING_RATE_SENSORS" /&gt;
&lt;uses-permission android:name="android.permission.POST_NOTIFICATIONS" /&gt;
&lt;uses-feature android:name="android.hardware.sensor.compass" android:required="true" /&gt;</pre>
            </div>
            <button onclick="requestAllPermissions()" class="w-full py-3 rounded-xl bg-white text-black font-bold text-sm transition hover:bg-zinc-200">
                تأكيد الأذونات
            </button>
        </div>
    </div>

    <!-- رسالة التنبيه (Toast) -->
    <div id="toast" class="fixed bottom-24 left-1/2 -translate-x-1/2 z-[60] bg-white text-black px-5 py-3 rounded-2xl shadow-2xl flex items-center gap-2 transform translate-y-20 opacity-0 transition-all duration-300 pointer-events-none">
        <i class="fa-solid fa-circle-check text-emerald-600"></i>
        <span id="toast-message" class="text-xs font-bold">رسالة إشعار</span>
    </div>

    <script>
        /* ==========================================
           نظام التطبيق الحقيقي (Real App Logic)
           ========================================== */
        
        let state = {
            userLat: 24.7136, // الرياض كافتراضي
            userLng: 46.6753,
            qiblaAngle: 0,
            currentHeading: 0,
            isAligned: false,
            audioEnabled: true,
            audioCtx: null,
            hasGyro: false
        };

        const MAKKAH_LAT = 21.4225;
        const MAKKAH_LNG = 39.8262;

        /* 1. نظام الأصوات الحقيقي (Web Audio API) */
        function initAudio() {
            if (!state.audioCtx) {
                const AudioContext = window.AudioContext || window.webkitAudioContext;
                if (AudioContext) state.audioCtx = new AudioContext();
            }
        }

        function playSound(type) {
            if (!state.audioEnabled) return;
            initAudio();
            if (!state.audioCtx) return;

            try {
                const ctx = state.audioCtx;
                if (ctx.state === 'suspended') ctx.resume();

                const osc = ctx.createOscillator();
                const gain = ctx.createGain();
                osc.connect(gain);
                gain.connect(ctx.destination);
                const now = ctx.currentTime;

                if (type === 'click') {
                    osc.type = 'sine';
                    osc.frequency.setValueAtTime(600, now);
                    osc.frequency.exponentialRampToValueAtTime(300, now + 0.05);
                    gain.gain.setValueAtTime(0.1, now);
                    gain.gain.exponentialRampToValueAtTime(0.01, now + 0.05);
                    osc.start(now); osc.stop(now + 0.05);
                } else if (type === 'aligned') {
                    osc.type = 'triangle';
                    osc.frequency.setValueAtTime(523.25, now); // C5
                    osc.frequency.setValueAtTime(659.25, now + 0.1); // E5
                    osc.frequency.setValueAtTime(783.99, now + 0.2); // G5
                    gain.gain.setValueAtTime(0.01, now);
                    gain.gain.linearRampToValueAtTime(0.15, now + 0.1);
                    gain.gain.exponentialRampToValueAtTime(0.001, now + 0.8);
                    osc.start(now); osc.stop(now + 0.8);
                }
            } catch (e) { console.log("Audio error:", e); }
        }

        function toggleAudio() {
            state.audioEnabled = !state.audioEnabled;
            const icon = document.getElementById('sound-icon');
            if (state.audioEnabled) {
                icon.className = "fa-solid fa-volume-high text-xs text-white";
                showToast("تم تفعيل الأصوات");
                playSound('click');
            } else {
                icon.className = "fa-solid fa-volume-xmark text-xs text-zinc-500";
                showToast("تم كتم الصوت");
            }
        }

        /* 2. حسابات القبلة الحقيقية */
        function calculateQiblaAngle(lat, lng) {
            const phi1 = lat * Math.PI / 180;
            const phi2 = MAKKAH_LAT * Math.PI / 180;
            const deltaLamda = (MAKKAH_LNG - lng) * Math.PI / 180;
            const y = Math.sin(deltaLamda);
            const x = Math.cos(phi1) * Math.tan(phi2) - Math.sin(phi1) * Math.cos(deltaLamda);
            let qiblaDeg = Math.atan2(y, x) * 180 / Math.PI;
            return Math.round((qiblaDeg + 360) % 360 * 10) / 10;
        }

        function calculateDistanceToMakkah(lat, lng) {
            const R = 6371;
            const dLat = (MAKKAH_LAT - lat) * Math.PI / 180;
            const dLng = (MAKKAH_LNG - lng) * Math.PI / 180;
            const a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(lat * Math.PI / 180) * Math.cos(MAKKAH_LAT * Math.PI / 180) * Math.sin(dLng/2) * Math.sin(dLng/2);
            return Math.round(R * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)));
        }

        /* 3. تهيئة شاشة الدخول */
        window.addEventListener('load', () => {
            const statusText = document.getElementById('splash-status-text');
            const progressBar = document.getElementById('splash-progress-bar');
            
            const steps = [
                { p: 25, t: "جاري تهيئة النظام..." },
                { p: 60, t: "جاري الاتصال بمستشعرات الحركة..." },
                { p: 85, t: "جاري حساب اتجاه القبلة..." },
                { p: 100, t: "اكتمل التحميل" }
            ];

            let currentStep = 0;
            const interval = setInterval(() => {
                if (currentStep < steps.length) {
                    progressBar.style.width = steps[currentStep].p + '%';
                    statusText.textContent = steps[currentStep].t;
                    currentStep++;
                } else {
                    clearInterval(interval);
                    playSound('aligned'); // صوت هادئ عند اكتمال التحميل
                    setTimeout(() => {
                        document.getElementById('splash-screen').style.opacity = '0';
                        setTimeout(() => {
                            document.getElementById('splash-screen').style.display = 'none';
                            document.getElementById('main-app').classList.remove('hidden');
                            document.getElementById('main-app').classList.add('flex');
                            initSensorsAndLocation();
                        }, 1000);
                    }, 600);
                }
            }, 1000);
        });

        function initSensorsAndLocation() {
            // 1. تحديد الموقع
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(pos => {
                    state.userLat = pos.coords.latitude;
                    state.userLng = pos.coords.longitude;
                    state.qiblaAngle = calculateQiblaAngle(state.userLat, state.userLng);
                    
                    document.getElementById('header-location').innerHTML = `<i class="fa-solid fa-location-dot text-emerald-400 text-[9px]"></i> تم تحديد موقعك بنجاح`;
                    document.getElementById('qibla-angle-target').textContent = state.qiblaAngle + '°';
                    document.getElementById('kaba-distance').textContent = calculateDistanceToMakkah(state.userLat, state.userLng).toLocaleString('ar-SA') + ' كم';
                    updateCompassUI(state.currentHeading);
                }, err => {
                    document.getElementById('header-location').innerHTML = `<i class="fa-solid fa-location-dot text-amber-400 text-[9px]"></i> الموقع الافتراضي (الرياض)`;
                    state.qiblaAngle = calculateQiblaAngle(state.userLat, state.userLng);
                    document.getElementById('qibla-angle-target').textContent = state.qiblaAngle + '°';
                });
            }

            // 2. مستشعر البوصلة الحقيقي
            if (window.DeviceOrientationEvent) {
                if (typeof DeviceOrientationEvent.requestPermission === 'function') {
                    DeviceOrientationEvent.requestPermission().then(permissionState => {
                        if (permissionState === 'granted') {
                            window.addEventListener('deviceorientation', handleOrientation);
                            state.hasGyro = true;
                        }
                    }).catch(console.error);
                } else {
                    window.addEventListener('deviceorientation', handleOrientation);
                    state.hasGyro = true;
                }
            }

            // إظهار المحاكي إذا لم يتوفر مستشعر
            setTimeout(() => {
                if (!state.hasGyro) {
                    document.getElementById('simulator-container').classList.remove('hidden');
                }
            }, 2000);
        }

        function handleOrientation(event) {
            let heading = event.alpha;
            if (event.webkitCompassHeading) heading = event.webkitCompassHeading;
            if (heading !== null && heading !== undefined) {
                state.currentHeading = Math.round(heading);
                updateCompassUI(state.currentHeading);
            }
        }

        function simulateRotation(deg) {
            state.currentHeading = parseInt(deg);
            document.getElementById('sim-angle-text').textContent = deg + '°';
            updateCompassUI(state.currentHeading);
        }

        /* 4. تحديث واجهة البوصلة */
        function updateCompassUI(heading) {
            document.getElementById('heading-degrees').textContent = heading;
            document.getElementById('compass-dial').style.transform = `rotate(${-heading}deg)`;
            document.getElementById('qibla-pointer').style.transform = `rotate(${state.qiblaAngle}deg)`;

            const widgetArrow = document.getElementById('widget-arrow');
            if (widgetArrow) {
                const widgetAngle = (state.qiblaAngle - heading + 360) % 360;
                widgetArrow.style.transform = `rotate(${widgetAngle}deg)`;
            }

            const diff = Math.abs((heading - state.qiblaAngle + 360) % 360);
            const isAlignedNow = diff <= 4 || diff >= 356;

            const badge = document.getElementById('qibla-badge');
            const dot = document.getElementById('qibla-status-dot');
            const statusText = document.getElementById('qibla-status-text');
            const glowRing = document.getElementById('glow-ring');
            const widgetStatus = document.getElementById('widget-status');

            if (isAlignedNow) {
                if (!state.isAligned) {
                    state.isAligned = true;
                    playSound('aligned');
                    showToast("أنت الآن باتجاه القبلة تماماً! ✨");
                    if ("Notification" in window && Notification.permission === "granted") {
                        new Notification("قبلتي", { body: "أنت الآن باتجاه القبلة الصحيح." });
                    }
                }
                badge.className = "inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-zinc-800 border border-white text-xs font-bold text-white shadow-[0_0_20px_rgba(255,255,255,0.2)] transition-all duration-300";
                dot.className = "w-2.5 h-2.5 rounded-full bg-white animate-ping";
                statusText.textContent = "أنت باتجاه القبلة الصحيح!";
                glowRing.className = "absolute inset-0 rounded-full border-2 border-white qibla-glow transition-all duration-500";
                if (widgetStatus) widgetStatus.innerHTML = `<span class="text-emerald-400">باتجاه القبلة تماماً</span>`;
            } else {
                state.isAligned = false;
                badge.className = "inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-zinc-900 border border-zinc-800 text-xs font-medium text-zinc-300 transition-all duration-300";
                dot.className = "w-2 h-2 rounded-full bg-amber-500 animate-pulse";
                statusText.textContent = "قم بتدوير الهاتف نحو القبلة";
                glowRing.className = "absolute inset-0 rounded-full transition-all duration-500 opacity-0";
                if (widgetStatus) widgetStatus.innerHTML = `<span class="text-zinc-400">جاري التحديد...</span>`;
            }
        }

        /* 5. إدارة النوافذ */
        function openModal(id) {
            playSound('click');
            document.getElementById(id).classList.remove('hidden');
        }
        function closeModal(id) {
            playSound('click');
            document.getElementById(id).classList.add('hidden');
        }

        /* 6. الإشعارات */
        function sendSampleNotification(type) {
            playSound('click');
            let msg = "";
            if (type === 'remember') msg = "هل غيرت مكانك؟ تذكر ضبط البوصلة لاتجاه القبلة!";
            else msg = "حان وقت التهيؤ للصلاة، القبلة جاهزة بلمسة واحدة!";
            showToast(msg);
            if ("Notification" in window) {
                if (Notification.permission === "granted") {
                    new Notification("قبلتي - تذكير", { body: msg });
                } else if (Notification.permission !== "denied") {
                    Notification.requestPermission().then(permission => {
                        if (permission === "granted") new Notification("قبلتي - تذكير", { body: msg });
                    });
                }
            }
        }

        function triggerNotification(msg) {
            playSound('click');
            showToast(msg);
            if ("Notification" in window && Notification.permission === "granted") {
                new Notification("قبلتي", { body: msg });
            }
        }

        function requestAllPermissions() {
            playSound('click');
            showToast("تم تأكيد الأذونات البرمجية!");
            closeModal('android-modal');
            if ("Notification" in window) Notification.requestPermission();
        }

        /* 7. رسائل التنبيه */
        function showToast(message) {
            const toast = document.getElementById('toast');
            document.getElementById('toast-message').textContent = message;
            toast.classList.remove('translate-y-20', 'opacity-0');
            toast.classList.add('translate-y-0', 'opacity-100');
            setTimeout(() => {
                toast.classList.remove('translate-y-0', 'opacity-100');
                toast.classList.add('translate-y-20', 'opacity-0');
            }, 3000);
        }
    </script>
</body>
</html>