// index.js
window.onload = function () {
    const prev = document.getElementById("prev");
    const next = document.getElementById("next");
    const img = document.getElementsByTagName("img")[0];
    const text = document.getElementsByClassName("text")[0];
    const pageInfo = document.getElementById("page-info");
    const pageAlert = document.getElementById("page-alert");
    let alertTimeout;

    const imgArr = [
        "./images/1.png",
        "./images/2.png",
        "./images/3.png",
        "./images/4.png",
        "./images/5.png",
        "./images/6.png",
    ];

    const textArr =[
        "“在与美国关系陷入危机之际，丹麦国王腓特烈十世对法国进行国事访问。”法国《20分钟报》以此为题报道称，丹麦国王及王后自3月31日起对法国进行为期3天的国事访问，此行以加强双边防务合作为重点。其间，丹麦王室夫妇受到法国总统马克龙和夫人的接待。",
    
         " 据丹麦《哥本哈根邮报》2日报道，作为升级丹麦防空能力的一部分，丹麦国王访法期间同马克龙达成一项购买法国地对空导弹的协议。多家国际媒体称，这是自1978年以来丹麦国王首次对法国进行国事访问。",
                
          "丹麦广播公司称，美国总统特朗普想要掌控格陵兰岛，在该岛引发不安。弗雷泽里克森的访问是加强丹麦与格陵兰岛合作、应对美国施压的必要举措。不过，虽然格陵兰岛新政府已成立，但尚需自治议会的批准，因此也有报道对弗雷泽里克森此行提出质疑，认为她“去得有点早”。格陵兰岛新一届自治政府负责外交事务的官员莫茨费尔特也认为，此时来访不太合适。尼尔森承认，目前其内部分歧“可能不是太积极的事情”。",
        
          "同时，美国政府对格陵兰岛的想法并未消退。据美国《华盛顿邮报》2日报道，知情人士透露，美国政府正在估算将格陵兰岛作为领土加以控制的成本和收益，是否向格陵兰岛自治政府提供更多的补贴也在白宫预算办公室工作人员的评估范围内。丹麦目前每年为格陵兰岛提供约6亿美元的补贴，一位匿名官员表示：“我们（美国）会比丹麦人付更多的钱。”",
        
          "《华盛顿邮报》报道称，一名白宫高级官员强调，所有的成本分析都是基于“格陵兰岛民众投票支持”的情况。该官员还称，相较于另两个“潜在收购”对象——加拿大和巴拿马运河，特朗普倾向于认为收购格陵兰岛“是最简单的”。不过，特朗普要“买岛”的说法遭到大量丹麦及格陵兰岛居民的谴责和反对。",
          "在丹麦国王结束访法的同一天，丹麦首相弗雷泽里克森开始对格陵兰岛进行为期3天的访问。丹麦首相办公室2日发文称，此次访问将加强与格陵兰岛的团结，首相将与格陵兰岛自治政府总理尼尔森会面，并就丹麦与格陵兰岛之间的密切合作进行讨论。尼尔森对她的来访表示欢迎，称丹麦仍是“格陵兰岛最亲密的伙伴”。"
    ];

    let index = 0;

    function showAlert(text) {
        pageAlert.textContent = text;
        pageAlert.classList.add("show");
        clearTimeout(alertTimeout);
        alertTimeout = setTimeout(() => {
            pageAlert.classList.remove("show");
        }, 1500);
    }

    function updatePageInfo() {
        pageInfo.textContent = `第${index + 1}页/共${imgArr.length}页`;
    }
    
    function fadeSwitch() {
        img.style.opacity = 0;
        text.style.opacity = 0;
        
        setTimeout(() => {
            img.src = imgArr[index];
            text.innerHTML = textArr[index];
            img.style.opacity = 1;
            text.style.opacity = 1;
            updatePageInfo();
        }, 300);
    }

    prev.onclick = function () {
        if (index > 0) {
            index--;
            fadeSwitch();
        } else {
            showAlert("当前已经是第一张啦！");
        }
    };

    next.onclick = function () {
        if (index < imgArr.length - 1) {
            index++;
            fadeSwitch();
        } else {
            showAlert("已经是最后一张咯~");
        }
    };

    // 初始化过渡效果和页数
    img.style.transition = text.style.transition = 'opacity 0.3s ease';
    updatePageInfo();
};
