$(document).ready(function () {
    expandTreeView();

});

function expandTreeView() {
    $('.dTreeNode ul').addClass('hidden');

    $('.expander-left').click(function (e) {
        e.preventDefault();
        $(this).toggleClass('close');
        $('.tree').toggleClass('hidden');
        if (parent.centercontent.cols != undefined) {
            if (parent.centercontent.cols == "9,*,0") {
                parent.centercontent.cols = "";
                parent.centercontent.cols = "260,*,0";
            } else {
                parent.centercontent.cols = "";
                parent.centercontent.cols = "9,*,0";
            }
        } else {
            if (top.frames['title'].cols == "260,*,0") {
                top.frames['title'].cols = "9,*,0";
            } else {
                top.frames['title'].cols = "260,*,0";
            }
        }
    });

    $('.dTreeNode a.open-close').click(function (e) {
        e.preventDefault();
        var curObj = $(this),
		openObj = $(this).parent().next();
        openObj.toggleClass('hidden');
        curObj.toggleClass('open');
    });

    $('.dTreeNode a.node').click(function (e) {
        e.preventDefault();
        var curObj = $(this),
		allObj = $('.dTreeNode a.node');
        allObj.removeClass('nodeSel');
        curObj.toggleClass('nodeSel');
    });

};

var counter = 1;
function pathTo(path, number) {

    var browser = navigator.userAgent.toLowerCase();

    if ((browser.indexOf('opera') > -1 || browser.indexOf('opr') > -1) && counter == 1) {
        try {
            var imageBlockTest = top.splash.$('.image-block');
        } catch (e) {

            /*alert(" You have a problem with elements displaying in Opera.");	*/
        }
        top.scenario.location.href = "srcErrorOpera.html";
        counter--;
    } else if (browser.indexOf('chrome') > -1 && counter == 1) {

        try {
            var imageBlockTest = top.splash.$('.image-block');
        } catch (e) {

            /*alert(" If you have a problem with elements displaying you should try to run Chrome with flags: --allow-file-access-from-files --disable-web-security \nTo do this, perform the following steps:\n 1 Close Chrome. \n2 Right click on Chrome icon and choose Properties. \n3 Add flags (--allow-file-access-from-files --disable-web-security) to the end of target line. \n4 Click Apply.");	*/
        }
        top.scenario.location.href = "srcError.html";
        counter--;
    }
    top.tree.$(".dTreeNode .nodeSel").removeClass("nodeSel");
    top.tree.$("#" + path).addClass("nodeSel");
    top.tree.$(".holder:has(.nodeSel)").parents().each(function () {
        if ($(this).hasClass('hidden')) {
            $(this).prev().find('.open-close').addClass('open');
            $(this).removeClass('hidden');
        }
    });
    var elemTop = $("#" + path).offset().top;
    var window_h = $(window).height();
    var docTop = $(document).scrollTop();
    if (elemTop > docTop && elemTop < (docTop + window_h)) {
    } else { $(document).scrollTop(elemTop); }


    top.$("#nav").attr('src', path + '/path.html');
    if (IsSourceCode(path)) {
        top.$("#scenario").attr('src', 'scenario2.html');
    } else {
        top.$("#scenario").attr('src', 'scenario1.html');
    }

}
function IsSourceCode(path) {
    var res = true;
    $.ajax({
        url: path + '/src.html',
        async: false,
        type: 'Get',
        success: function () {
            res = true;
        },
        error: function (data) {
            if (data.status != 200)
                res = false;
            else res = true;
        }
    });
    return res;
}