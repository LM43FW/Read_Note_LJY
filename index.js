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
    ];

    const textArr =[
        "古文正与宋思儒，这两位战功卓著的老战士，是《英雄人生》第三集的主人公。他们都是烟台人，都出身贫寒，都参加了山东八路军，后来又都成为三野主力九兵团的战士，在解放战争的历次战役中表现出色。",
        "后来，又都随大军奔赴朝鲜战场，一齐投入长津湖畔的冰与火之中。这两位老战士少年时都未曾上过学，是人民军队改变了他们的命运。他们先后在部队的扫盲文化班中启蒙，掌握了读写能力，并开始了专业学习。",
        "在采访中，古正文老人对我军在解放战争与抗美援朝战争中作战与战术特点，都做了精彩的总结和分析。我们曾问到了古文正老人关于我军师、团各级在进攻与防御中战斗队形的大小与特点，古文正老人的回答也是如数家珍，从他后来亲自指挥的战斗开始讲起，一直回溯此前参与的历次战斗。因为后来所掌握的指挥技巧与经验，他对我军在解放战争与抗美援朝战争中作战与战术特点，都做了精彩的总结和分析。尤其是对我军迂回穿插战法的组织与实施的讲解，令我们有醍醐灌顶之感。在本片中，古文正老人还讲到了长津湖战役中我军的战场火力配系，而这一段讲述，也只是对我们前三十年火力配系描述的一部分，全程听下来，也非常震撼。",
        "来自第30军的宋思儒，在抗美援朝战争结束后，转入海军服役，成为了海军岸防炮兵的一名指挥员，他还参加了对旅顺要塞的接收，1958年还参加了炮击金门的战斗，在这场战斗中，他是唯一一个海岸炮兵连的连长，而同样在这场战斗中涌现出的战斗英雄——安业民，正是宋思儒培养出的战斗骨干。",
        "古文正后来成长为一名优秀的指挥员，在我军的作战与建设中做出了很大的贡献，1979年，他还作为58师参谋长，指挥部队参加了对越自卫反击战。"
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

