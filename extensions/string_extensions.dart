
extension StringExtensions on String{

  bool get isNullOrEmpty => isEmpty;

  String capitalize(){
    if(isNullOrEmpty) return this;

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  bool get isValidEmail {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );
    return emailRegex.hasMatch(this);
  }
}

extension NullableStringExtensions on String?{

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  String? capitalize(){
    if(isNullOrEmpty) return this;

    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }

  bool get isValidEmail {
    if (isNullOrEmpty) return false;
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );
    return emailRegex.hasMatch(this!);
  }
}

// ^: Dizenin başı. Eşleşme dizenin başından başlayacak.

// [a-zA-Z0-9._%+-]+: Kullanıcı adı kısmı:
//   [a-zA-Z0-9]: Küçük ve büyük harfler (a-zA-Z) ve rakamlar (0-9)
//   [._%+-]: Nokta, alt çizgi, yüzde işareti, artı işareti ve eksi işareti gibi karakterler.
//   +: Bu karakterlerden bir veya daha fazlasının bulunması gerektiğini belirtir.

 // "@" işareti: E-posta adreslerinin ana bölümü olarak kullanıcı adı ve alan adı arasındaki ayırıcıdır.

// [a-zA-Z0-9.-]+: Alan adı kısmı:
//   [a-zA-Z0-9]: Harfler ve rakamlar
//   [.-]: Nokta ve tire (-) karakterlerinin kabul edilmesi.
//   +: Bu karakterlerden bir veya daha fazlasının olması gerekir.

// \. : Nokta (.) karakterini belirtir. Nokta, özel bir karakter olduğu için escape edilmiştir.

// [a-zA-Z]{2,}: Uzantı kısmı:
//   [a-zA-Z]: Alan adı uzantısı harflerden oluşur (örneğin .com, .net).
//   {2,}: Uzantının en az 2 harf uzunluğunda olması gerektiğini belirtir (örneğin `.co`).
//   Bu kısmın en az 2 harf olması gerektiği vurgulanır.

//$ : Dizenin sonu. Eşleşme dizenin sonuyla bitmeli.