import 'dart:io';

class Product{
  String urunAdi;
  double fiyat;

  Product(this.urunAdi, this.fiyat);
}

class ShoppingCart{
  List<Product> urunListesi = [];
  double topTutar = 0;

  void urunEkle(Product urun){
    urunListesi.add(urun);
    topTutar += urun.fiyat;
  }

  double tutarHesapla(int yas){
    double indirim = 0;
    if(yas < 18){
      indirim = 0.10;
    }
    else if(yas >= 18 && yas <= 60){
      indirim = 0.05;
    }
    else{
      indirim = 0.15;
    }

    return topTutar - (topTutar * indirim);
  }
}

void main(){
  var sepet = ShoppingCart();

  print("Yaşınızı girin:");
  int yas = int.parse(stdin.readLineSync()!);

  print("Müşteri numaranızı girin:");
  String musteriNo = stdin.readLineSync()!;

  while(true){
    print("Ürün adı girin (Çıkmak için 'q' yazın):");
    String urunAdi = stdin.readLineSync()!;
    
    if (urunAdi.toLowerCase() == 'q') {
      break;
    }

    print("Ürün fiyatını girin:");
    double urunFiyati = double.parse(stdin.readLineSync()!);

    var urun = Product(urunAdi, urunFiyati);
    sepet.urunEkle(urun);

    for(var sepettekiUrun in sepet.urunListesi){
      print("${sepettekiUrun.urunAdi}, ${sepettekiUrun.fiyat} tl");
    }
    print("İndirimsiz tutar: ${sepet.topTutar} tl");
    print("İndirimli tutar: ${sepet.tutarHesapla(yas)} tl");
  }
}