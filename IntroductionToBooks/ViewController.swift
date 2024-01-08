//
//  ViewController.swift
//  IntroductionToBooks
//
//  Created by Labe on 2024/1/7.
//

import UIKit

class ViewController: UIViewController {

    //拉出會設定到的UI元件
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var IntroductionTextView: UITextView!
    @IBOutlet weak var bookPageControl: UIPageControl!
    @IBOutlet weak var topSC: UISegmentedControl!
    
    //建立書籍(Image)、簡介(Textview)、排行(Label)陣列
    let booksArray = ["藥師少女的獨語", "繼母的拖油瓶是我的前女友", "86-不存在的戰區", "天官賜福", "吾命騎士"]
    let introductionArray = [
        "「可否為我配製一帖春藥？」貓貓的眼眸瞬間浮現出驚訝與好奇的色彩──位處大陸中央的某個大國，有位姑娘置身於皇帝宮闕之中。姑娘名喚貓貓，原在煙花巷擔任藥師，眼下則在後宮做下女。這個絕對稱不上美女的姑娘很懂分寸，只是靜待期滿離宮。她有自信，皇帝絕對不會「寵幸」她。其間，貓貓得知皇子皆年幼早夭的事，並聽聞連尚在人世的皇子皇女也身染重病，她開始調查他們的病因。以中世東方為舞臺，「試毒」少女將一一解決宮中發生的懸疑案件！",
        "再次成為情侶的結女與水斗──心情興奮浮躁，展開跟戀人同住一個屋簷下的全新日常生活！不但背著雙親卿卿我我，「我想……再獨占你一下下，好不好？」也暫時先跟朋友保密。兩人享受祕密關係的同時，卻對於這種無法跨越「一家人」界線的環境感到焦急難耐。情人節與白色情人節過得像情侶一樣幸福，期末考也互相支持順利過關，但彼此就是無法再多伸手個幾公分……「結婚紀念日也到了，我們想來個遲來的蜜月旅行。」爸媽不在的三天期間終於到來。可是──主動開口不就是輸了？帶著羞怯與自尊，這場毅力之戰會是誰輸誰贏？",
        "共和國民的避難作戰付出了巨大犧牲。這場敗北不只重創了辛等機動打擊群人員，在前線指揮的蕾娜以及未能參加作戰的芙蕾德利嘉也受到極大影響。為了生存，不能永遠甘於愚蠢──他們開始思考「今後」的問題。至於聯邦國內，由於戰況惡化，民眾開始大肆抨擊政府高層以及八六。最後終於出現少數叛逃部隊試著依賴禁忌的一步……",
        "三界的笑柄、奇葩，曾經的仙樂太子謝憐又飛升啦！天界抖三抖，鐘掉了，金殿也塌了，受害者還是他昔日下屬。太子殿下莫不是在挾怨報復？畢竟他曾是世人眼中無所不能、人見人愛，堪稱人間正道、世界中心的花冠武神，但八百年飛升三次，卻從武神、瘟神，一路做到破爛神，過去下屬如今的地位還比他高。對此謝憐表示：還好呀！為扛起責任，掙得八百八十八萬功德「還債」，謝憐接下查明與君山鬼新郎屢劫新娘一案。只是被貶兩次，兩道咒枷在身，在人間法力等於零的他還需要點助力，像是兩位聽說是自願前來的昔日部屬……的下屬，一條可靈活驅使的若邪綾，以及──欸，這位劫他花轎，為他撐傘破陣的紅衣少年是……四大害？鬼王？「血雨探花」花城？！",
        "老師教我神術時，常驚奇地說：「孩子，你真是個天生的祭司料。如果你當初入的是光明殿，那你未來肯定是光明殿有史以來數一數二強的教皇！不過既然你選擇加入聖殿，未來只好當一名很弱的太陽騎士了。」我是一名騎士，更準確地說，是光明神殿的太陽騎士。光明神殿侍奉的是光明神，在凱亞斯大陸上，是勢力前三大的信仰。全大陸的人都知道，光明神殿最著名的是十二聖騎士，每一位聖騎士都有自己「該有的」個性和特徵。太陽騎士就是得有一頭燦爛的金髮、蔚藍雙眼，以及璀璨笑容，還有著悲天憫人的個性。「仁慈的光明神會原諒你的罪惡。」這句話在我的騎士生涯中至少說過上百萬次！但我這輩子最大的期望就是能在全大陸面前大吼：「去你媽的『全大陸都知道』，我這個太陽騎士就是不爽笑！我就是不想原諒那些人渣！我就是想說每一句話的時候都帶『X』字！」可惜，到目前為止，我還是帶著笑容繼續說：「仁慈的光明神會原諒你的罪惡。」"
    ]
    let topLabelArray = [
        "熱銷排行Top 1\n藥師少女的獨語",
        "熱銷排行Top 2\n繼母的拖油瓶是我的前女友",
        "熱銷排行Top 3\n86-不存在的戰區",
        "熱銷排行Top 4\n天官賜福",
        "熱銷排行Top 5\n吾命騎士"
    ]
    
    //建立變數index，用來追蹤當前顯示的書籍
    var index = 0
    
    //用來更新書籍、簡介、排行榜畫面、文字的funtion
    func changeBook() {
        //顯示當前在booksArray(圖片)中第index位置的圖片
        bookImageView.image = UIImage(named: booksArray[index])
        //顯示當前在topLabelArray(排行)中第index位置的字串
        topLabel.text = topLabelArray[index]
        //顯示當前在introductionArray(簡介)中第index位置的字串
        IntroductionTextView.text = introductionArray[index]
        //簡介轉換時，會從最上方重新顯示內容，如果沒有設定，下一頁的簡介會停留在你原本滑到的位置，例如往上滑３行文字後按下一頁，下一頁的簡介就會看不到前3行，要自己滑回去看。
        IntroductionTextView.setContentOffset(CGPoint.zero, animated: false)
        //PageControl顯示在當前對應位置上
        bookPageControl.currentPage = index
        //SegmentedControl顯示在當前對應位置上
        topSC.selectedSegmentIndex = index
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定初始顯示畫面
        bookImageView.layer.cornerRadius = 45
        bookImageView.image = UIImage(named: booksArray[0])
        topLabel.text = topLabelArray[0]
        IntroductionTextView.text = introductionArray[0]
    }

    //下一頁的按鈕，計算index位置後執行畫面轉換的funtion
    @IBAction func nextButton(_ sender: Any) {
        index = (index + 1) % booksArray.count
        changeBook()
    }
    
    //上一頁的按鈕，計算index位置後執行畫面轉換的funtion
    @IBAction func backButton(_ sender: Any) {
        index = (index + booksArray.count - 1) % booksArray.count
        changeBook()
    }
    
    //按下分頁控制器時執行畫面轉換
    @IBAction func pageControlSwith(_ sender: UIPageControl) {
        index = sender.currentPage
        changeBook()
    }
    
    //按下分段控制器時執行畫面轉換
    @IBAction func segmentedControlSwith(_ sender: UISegmentedControl) {
        index = sender.selectedSegmentIndex
        changeBook()
    }
    
    //向右滑動手勢識別時執行上一頁
    @IBAction func rightSwipe(_ sender: Any) {
        index = (index + booksArray.count - 1) % booksArray.count
        changeBook()
    }
    
    //向右滑動手勢識別時執行下一頁
    @IBAction func leftSwipe(_ sender: Any) {
        index = (index + 1) % booksArray.count
        changeBook()
    }
    
    
}

