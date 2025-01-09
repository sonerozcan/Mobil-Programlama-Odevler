class insan{
  String _isim = "";

  insan(this._isim);

  SetIsim(String isim){
    this._isim = isim;
  }

  String isim(){
    return _isim;
  }


}

class hoca extends insan{
  String bolum;

  hoca(String isim,this.bolum) : super(isim);

  void dersCalis(){
    print('$isim ders anlatmak için çalışıyor.');
  }

  // Sınav yapma metodu
  void sinavYap() {
    print('$isim sınav yapıyor.');
  }

  // Polymorphism: ekle metodunu override ediyor
  @override
  void ekle(String bilgi) {
    print('$isim hoca $bilgi ekledi.');
  }
}

class ogrenci extends insan{
  String bolum;

  ogrenci(String isim, this.bolum) : super(isim);

  void dersCalis() {
    print('$isim ders çalışıyor.');
  }

  void sinavOl() {
    print('$isim sınava giriyor.');
  }

  @override
  void ekle(String bilgi) {
    print('$isim öğrenci $bilgi ekledi.');
  }
}

class sekreter extends insan{
  sekreter(String isim) : super(isim);

  void hocaEkle(hoca hoca, String ders) {
    print('$isim sekreter $ders dersini hocaya ekledi: ${hoca.isim}');
  }

  void ogrenciEkle(ogrenci ogrenci, String bolum) {
    print('$isim sekreter $bolum bölümüne öğrenci ekledi: ${ogrenci.isim}');
  }
}

void main() {
  var hoca1 = hoca('Murat', 'Bilgisayar Mühendisliği');
  hoca1.dersCalis();
  hoca1.sinavYap();
  hoca1.ekle('Danışmanlık yaptığı öğrencinin dersini onayladı.');

  var ogrenci1 = ogrenci('Ahmet', 'Bilgisayar Mühendisliği');
  ogrenci1.dersCalis();
  ogrenci1.sinavOl();
  ogrenci1.ekle('Yeni ders ekledi.');

  var sekreter1 = sekreter('Ayşe');
  sekreter1.hocaEkle(hoca1, 'Yapay Zeka');
  sekreter1.ogrenciEkle(ogrenci1, 'Bilgisayar Mühendisliği');
}