//
//  ViewController.swift
//  Timer
//
//  Created by Alihan Demir on 1.02.2019.
//  Copyright © 2019 Alihan Demir. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var timer = Timer()
    
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var lblSuccess: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getTime), userInfo: nil, repeats: true)
       updateSuccessWordLable()
    }
 
    var successWords = [
       "Alet işler, el övünür...",
       "Başarı belki insana çok şey öğretmez, fakat başarısızlık çok şey öğretir... Çin atasözü",
       "Başarı kuvvetli olana gülümser, başarısızlık zayıflara çullanır... Oscar Wilde",
       "Başarı tatlıdır ama çoğu zaman ter kokar... Anomim",
       "Başarılarını gizlemek, en büyük başarıdır... La Rochefoucauld",
       "Başarının dört şartı; bilmek, istemek, cesaret etmek ve susmak... Munthe",
       "Başarıyı en kötü şekilde kullanmak, onunla övünmektir... De Maupassant",
       "Büyük başarıların sahipleri küçük işleri titizlikle yapabilme sabrını gösteren kişilerdir... Schiller",
       "Dünyada başarı kazanmanın iki yolu vardır: Ya kendi aklından faydalanmak, yahut da başkalarının akılsızlığından faydalanmaktır... La Bruyere",
       "Güçlükler, başarının değerini artıran süslerdir... Moliere",
       "Hiç kimse, başarı merdivenine elleri cebinde tırmanmamıştır... Moorhead",
       "İyi bir başlangıç, yarı yarıya başarı demektir... Andre Gide",
       "Para nasıl parayı çekerse, başarı da başarıyı çeker... De Chamfort ",
       "Nerede olursanız olun, elinizdekilerle yapabileceğinizi yapın...Theodore Roosevelt",
       "İnsan sahip olduklarının toplamı değil, fakat henüz gerçekleştiremediklerinin toplamıdır... Jean Paul Sartre",
       "İnsanın yaşam düzeyini bilinçli bir çabayla yükseltme konusundaki tartışma götürmez yeteneğinden daha cesaret verici bir gerçek bilmiyorum... Henry Davıd Thureau",
       "Başarı bir yolculuktur, bir varış noktası değil... Ben Sweetland",
       "Baş+arı: “Baş” olmak için “arı” gibi çalışmak gerekir... Mümin Sekman",
       "Ahlak konusunda en önemli dersler kitaplardan değil, yaşanan deneyimlerden alınır... Mark Twain",
       "Deneyim düşüncenin, düşünce ise eylemin çocuğudur... B.Disraeli",
       "İnsanlar öğrenme dürtüsüyle doğarlar. Öğrenmeye karşı merak ve bundan duyulan zevk insanın doğasında vardır. Bunlar bebeklikten başlayarak zamanla yok edilir... W.E.Deming",
       "Coşku, zekadan daha önemlidir... Albert Einstein",
       "Düşünmek ve söylemek kolay, fakat yaşamak, hele başarı ile sonuçlandırmak çok zordur... Ziya Gökalp",
       "Başarının sırlarından biri, geçici başarısızlıkların bizi yenmesine izin vermemektir... Mark Kay",
       "Yapabildiğimiz herşeyi yapsaydık, buna kendimiz bile şaşardık... Thomas Edison",
       "Kafesten çıkınca değil, kafesi içimizden çıkarınca özgürleşiriz... Mümin Sekman",
       "Başkaları için duyduğun kaygı, kendin için duyduğun kaygıların önüne geçtiği zaman olgunlaşmışsın demektir... John Mac Noughton",
       "Zenginlik ve güzellikle birlikte bulunan ihtişam geçicidir ve kolay zedelenebilir. Erdemse muhteşem ve ölümsüz bir servettir... Sallust",
       "Başkaları yararına iyi bir şey yapmak görev değil, zevktir. Çünkü sizin sağlık ve mutluluğunuzu artırır... Zoroaster",
       "Bir şey biliyorum, o da hiçbir şey bilmediğimdir... Sokrates",
       "Başarınızı ilk unutan, başarısızlığınızı ilk gören siz olun... Mümin Sekman",
       "Engeller beni durduramaz, her bir engel kararlılığımı daha da güçlendirir... Leonardo da Vinci",
       "Üstelemek başarının temel unsurudur. Kapıyı yeterince uzun süre ve yüksek sesle çalarsanız, birilerini uyandıracagınızdan emin olabilirsiniz... Henry Wadsworth Longfellow",
       "Bir kitap bir aynadır. Ona bir eşek bakacak olursa karşısında elbette bir evliya görmez... Goergo C.Lichtenberg",
       "Oğlum, bütün hayatımı kolların ve ayakların belirlemeyecek. Hayatına asıl yön verecek olan beynin ve kalbindir. Bir şeyi gerçekten istiyorsan, bütün engelleri yenip ona ulaşabilirsin... Shelton Skelton",
       "Dünyanın acı ile dolu olduğu doğrudur ama bir çok insan da bunun üstesinden gelmektedir... Helen Keller",
       "Arzu varsa çözümde vardır... Anonim",
       "Olumsuz düşünceleri zihinsel canavarlar halini almadan önce yok edin... Anonim",
       "Sizi korkutan her deyim size güç, cesaret ve güven kazandırır. Kendinize “Ben bu dehşeti yaşadım. Bundan sonra gelecek şeylere hazırım” dersiniz... Eleanor Roosevelt",
       "Düş kurmak değil, bir düşe sahip olmamak budalalıktır. Cliff Clavin, Cheers",
       "Başkalarına yardımcı olmak için elinize her zaman büyük fırsatlar geçmez, ama küçük fırsatlar hergün çıkar. Sally Koch",
       "Başarıya ulaşıp sıcrama yapan bireyler, aynı zamanda değişimin ustaları olacaklardır... R. Kanter",
       "Aradığını bilmeyen, bulduğunu anlayamaz... Cladue Bernard",
       "Mevcut bilgi birikimimizle öyle sorunlar yaratırız ki aynı birikimimiz bu sorunları çözmemize yetmez... Albert Einstein",
       "Bilgi, tek başına ekonomik bir kaynak değildir. Bilgi alınıp satılamaz, sadece bilgiyle yaratılanlar alınıp satılabilir... P.Drucker",
       "Hayatta rasladığım herkes, bir bakımdan bana üstüdür. Bu yüzden kendisinden bir şeyler öğrenebilirim... Emerson",
       "İlk çağlarda güçlü olan, endüstri çağında zengin olan kazanırdı. Bilgi çağında ise bilgili olan kazanacaktır... A. Toffler",
       "Ne kadar bilirsen bil, söylediklerin karşısındakilerinin anlayabiceği kadardır... Mevlana",
       "Tez elde edilen başarı, insanı kararsız ve maceraperest yapar... Bacon",
       "Güçlükler başarının değerini artıran süslerdir... Moliere",
       "Ne başarırsanız başarın, size yardım eden mutlaka vardır... Athea Gibson",
       "En sıradan iş bile büyük başarılar getirme potansiyeline sahiptir... H.Jackson Brown",
       "Başarılarını gizlemek en büyük başarıdır... La Rochefoucauld",
       "Başarı isdediğini elde etmek, mutluluksa elde ettiğini sevmektir. Brown",
       "Büyük aşkların ve büyük başarıların büyük riskler içerdiğini unutma. Kim iyi yaşamış, bol bol gülmüş ve çok sevmişse, başarıyı yakalamış demektir... Bessie Anderson Stanley",
       "Ders alınmış başarısızlık başarı demektir... Malcom S. Forbes",
       "Mağlubiyete uğrayınca ümitsizliğe kapılma, her başarısızlıkta bir zafer arzusu yatar... Germain Martin",
       "Başarısızlıklar, kuvvetlilere daha da kuvvet verir... Saint Exupery",
       "İyi bir başlangıç, yarı yarıya başarı demektir... Andre Gide",
       "Her şeyin mühim noktası, başlangıçtır... Eflatun",
       "Bütün büyük işler, küçük başlangıçlarla olur... Cicero",
       "Bir milletin büyüklüğü, nüfusunun çokluğu ile değil, akıllı ve fazilet sahibi adamlarının sayısı ile belli olur... Victor Hugo",
       "İyi bir kafaya sahip olmak yetmez; mesele onu iyi kullanmaktır... Rene Descartes",
       "Yapacağın ilkşeyi kafanda net olarak görmelisin... Alex Moorison",
       "Güzel cevap her zaman daha güzel soruyu sorana verilir. E. E. Cummings",
       "En büyük zaman hırsızı kararsızlıktır. C. Floru",
       "Yapmak istediğin herşeyi düşünerek karar ver, verdiğin kararıda mutlaka gerçekleştir... Benjamin Franklin",
       "Limiti koyan zihindir. Zihin bir şeyi yapabileceğini kestirebiliği kadar başarılı olur. Yüzde 100 inandığın sürece her şeyi yapabilirsiniz... Arnold Schwarzenegger",
       "Gerçek başarı başarısızlık korkusunu yenebilmektir... Sweeney",
       "Başarı,küçük hataların ve başarısızlıkların biraz ilerisinde duran şeydir. T. J. Watson",
       "Kişinin geleceğe dönük umutları şimdiki güçünün kaynağıdır... Maxwel",
       "Erişmek istedikleri bir hedefi olmayanlar, çalışmaktan zevk almazlar... Emile Raux",
       "Bazı yenilgilerin nedeni, insanların işi yarıda bıraktıklarında, başarıya ne kadar yakın olduklarını bilememeleridir... Thomas Edison",
       "Pek çok konuda başarı, başarmanın ne kadar vakitalacağını bilmeye bağlıdır... Montesgieu",
       "Demir mıklatısa aşıktır. Hep ona doğru koşar, zaferde sabra aşıktır ve devamlı ona koşar... Sühreverdi",
       "Beklemeyi bilen insan herşeyi elde edebilir... Benjamin Disraeli",
       "Dünyada yeteneksiz insan yoktur. Sadece iyi eğitilmemiş ve iyi yönlendirilmemiş insanlar vardır... Angle Peartri",
       "Tembel insan yoktur. Sadece kendisine esin kaynağı oluşturacak kadar güçlü amaçları olmayan insanlar vardır... Anthony Robbins",
       "Hayatta yapabileceğiniz en büyük hata, sürekli bir hata daha yapacağımız korkusudur... Albert Hubbard",
       "Nerede olursanız olun, elinizdekilerle yapabileceklerinizi yapın... Theodore Roosevelt",
       "Taşı delen suyun gücü değil, damlaların sürekliliğidir... Latin Atasözü",
       "En iyi dost, bendeki en iyi yönleri ortaya çıkaran insandır... Henry Ford",
       "Batan güneş için ağlayın, yeniden doğduğunda ne yapacağınıza karar verin... Dale Carnegde",
       "Başarıya ulaşamayanların yüzde doksanı yenilgiye uğramamıştır. Sadece pes etmişlerdir... Paul J. Meyer",
       "İnsan bir şeyi, çok ciddi olarak arzu etmeye görsün, hiçbir şeyi erişilmeyecek kadar yüksekte değildir... Hans C. Andersen",
       "Plansız çalışan kimse, ülke ülke dolaşıp hazine arayan bir insana benzer... Descartes",
       "Hepimiz zamanın kısalığında söz ederiz de; boş geçen zamanı nasıl geçireceğimizi bilmeyiz... Seneca"
    ]
    
    @objc func getTime(){
        
        let date = Date()
        let calendar = Calendar.current
        
        let components = calendar.dateComponents( [.year, .month, .day , .hour , .minute , .second], from: date)
        
        let currentDate = calendar.date(from: components)
        let userCalendar = Calendar.current
        
        var dgsDate = DateComponents()
        dgsDate.year = 2019
        dgsDate.month = 6
        dgsDate.day = 30
        dgsDate.hour = 9
        dgsDate.minute = 30
        dgsDate.second = 00
        
       let competitionDay = userCalendar.date(from: dgsDate)
        
        let CompetitionDayDifference = calendar.dateComponents([.day, .hour, .minute,.second], from: currentDate!, to: competitionDay!)
        
        let daysLeft = CompetitionDayDifference.day
        let hoursLeft = CompetitionDayDifference.hour
        let minutesLeft = CompetitionDayDifference.minute
        let secondsLeft = CompetitionDayDifference.second
        
        lblCounter.text = "\(daysLeft ?? 0) Gün, \(hoursLeft ?? 0) Saat, \(minutesLeft ?? 0) Dakika \(secondsLeft ?? 0) Saniye Kaldı"
    }
    
    func successWord() -> String {
        let success = successWords.randomElement()
        return success!
    }
    
    func updateSuccessWordLable(){
        let success = successWord()
        lblSuccess.text! = success
    }
    
}
