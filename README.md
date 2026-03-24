# Filmku - Film Uygulaması Arayüzü (UI)

Bu proje, Flutter temellerini uygulamalı öğrenmek ve bir UI tasarımını başarılı bir şekilde koda dökebilme yeteneğini geliştirmek amacıyla yapılmıştır. Arka planda herhangi bir veri tabanı (backend) olmadan tamamen arayüz katmanına (UI/UX) odaklanılarak geliştirilmiştir.

## 🎨 Tasarım Referansı
Tasarım kaynağı olarak Figma topluluğunda yer alan şu dosya referans alınmıştır:
[Filmku - Figma Topluluk Dosyası](https://www.figma.com/community/file/1054431643740926668)

## 🛠️ Neler Kullanıldı?
* **Esnek ve Kaydırılabilir Düzen (Layout & Scroll):** Yatay/dikey listeler için `ListView` ve karmaşık üst üste binme (overlap) görselleri için `Stack` kullanımları.
* **Modern Özellikler:** Kod hizalamak için (Flutter 3.30+) `Row` ve `Column` içinde `spacing` parametresi.
* **Paketler:** Vektörel ikonlar için `flutter_svg`, tipografi için `google_fonts`.
* **Mock Katmanı:** Uygulama akışının çalışabilmesi için sabit listeli model sınıfları.

---

## 📂 Proje Klasör Yapısı (Folder Structure)
Proje, özellik odaklı (Feature-First) bir mimari yaklaşımıyla, kod okunuşunu ve yönetimini kolaylaştırmak için aşağıdaki gibi sınıflandırılmıştır:

```text
lib/
│
├── core/
│   ├── constants/             # Sabit veriler (Örn: MockData)
│   └── theme/                 # Renk, tipografi ve tema (AppColors, AppTextStyles)
│
├── features/                  # Ana özellik modülleri
│   ├── detail/                # Film detay ekranı ve parçaları (Header, Cast, Content)
│   ├── home/                  # Ana sayfa listeleri (Now Showing, Popular vb.)
│   └── main/                  # Alt yönlendirme menüsü (BottomNavigationBar)
│
├── models/                    # Veri modelleri (Movie, Cast)
│
└── main.dart                  # Uygulama başlangıç noktası
```

---

## 🧩 Çekirdek (Core) Katmanı Mimarisi

Tasarımın tutarlı olabilmesi için uygulamanın her yerinde aynı renk, font ve veriler kullanılmıştır. Bu alt yapılar `lib/core` dizini altında merkezi ve modüler bir şekilde kodlanmıştır.

### 1. Renk Paleti (`AppColors`)
Tasarımın genel hissini yansıtan renkler, tek bir sınıfta `static const` olarak tanımlanıp arayüzün içine dağıtılmıştır.

```dart
// lib/core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Arka plan
  static const Color background = Color(0xFFFFFFFF);
  
  // Yazı Renkleri
  static const Color textPrimary = Color(0xFF110E47);
  static const Color textSecondary = Color(0xFF9C9C9C);
  
  // Rozet (Badge) ve Vurgular
  static const Color ratingStar = Color(0xFFFFC319);
  static const Color badgeBackground = Color(0xFFDBE3FF);
  static const Color badgeText = Color(0xFF88A4E8);
}
```

### 2. Tipografi ve Fontlar (`AppTextStyles`)
Figma'daki tasarım dilini yansıtmak amacıyla **Serif** (başlıklar için: Merriweather) ve **Sans-Serif** (gövde için: Mulish) fontları tanımlanmış ve projede kullanımı standartlaştırılmıştır.

```dart
// lib/core/theme/app_text_styles.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String serifFontFamily = 'Merriweather';
  static const String sansSerifFontFamily = 'Mulish';

  // Kalın Başlık Örneği
  static const TextStyle heading1 = TextStyle(
    fontFamily: serifFontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: AppColors.textPrimary,
  );

  // Gövde (Açıklama vb.) Örneği
  static const TextStyle bodyText = TextStyle(
    fontFamily: sansSerifFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );
}
```

### 3. Uygulama Teması (`AppTheme`)
Renkler ve tipografi sistemin geneline bir ana `ThemeData` üzerinden dahil edilmiştir. Bu sayede `Scaffold` arka planları, varsayılan metin stilleri veya renk temaları projenin tamamında tek noktadan kontrol edilebilir.

```dart
// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.textPrimary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.textPrimary,
        secondary: AppColors.badgeText,
        surface: AppColors.background,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: AppTextStyles.heading2,
      ),
      // ... textTheme tanımları vs.
    );
  }
}
```

### 4. Örnek Veri Katmanı (`MockData`)
Sistemin dolu görünmesi için filmler, aktörler ve rating özellikleri statik bir model listesinde konumlandırılmış, ayrıca kullanılacakları menüye göre özellik (property) yardımıyla (`isNowShowing`, `isPopular`) listelere filtrelenerek ayrılmıştır. 

```dart
// lib/core/constants/mock_data.dart
import '../../models/cast_model.dart';
import '../../models/movie_model.dart';

class MockData {
  static const List<Movie> movies = [
    Movie(
      id: '1',
      title: 'Spiderman: No Way Home',
      posterUrl: 'assets/images/spiderman_poster.png',
      rating: 9.1,
      genres: ['ACTION', 'ADVENTURE', 'FANTASY'],
      length: '2h 28min',
      isNowShowing: true,
      // ... Diğer özellikler ve cast listesi
    ),
    // ... Diğer filmler
  ];

  // Özelliklerine Göre Listeleri Filtreleme
  static List<Movie> get nowShowing => movies.where((m) => m.isNowShowing).toList();
  static List<Movie> get popular => movies.where((m) => m.isPopular).toList();
}
```

---

## 🚀 Projeyi Kurma ve Çalıştırma
Repoyu indirdikten sonra cihazınızda çalıştırabilmek için terminal üzerinden sırasıyla şu adımları uygulayın:

```bash
# 1. Depoyu klonlayın
git clone <repo-url>

# 2. Gerekli paketleri çekin
flutter pub get

# 3. Projeyi çalıştırın
flutter run
```
