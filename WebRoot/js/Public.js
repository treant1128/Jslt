
/**
 * 弹出新窗口。新窗口的长、宽、左边距、上边距由参数来定义。

 */
var Window_PopWindow = null;
function OpenNewWindow(path, height, width, left, top)
{
    var sFeature;
    sFeature = "directories=no,status=yes,toolbar=no,menubar=no,scrollbars=yes,status=no,resizable=yes";
    if (height > 0) {
	    sFeature += ",height=" + height;
    }
    if (width > 0) {
	    sFeature += ",width=" + width;
    }
    if (left >= 0) {
	    sFeature += ",left=" + left;
    }
    if (top >= 0) {
    	 sFeature += ",top=" + top;
    }
     
	if (Window_PopWindow == null)
		Window_PopWindow = window.open(path,"", sFeature);
	else
	{
		if (Window_PopWindow.closed)
			Window_PopWindow = window.open(path,"", sFeature);  
		else {
			Window_PopWindow.close();
			Window_PopWindow = window.open(path,"", sFeature); 
		}
	}
     
    if (height <= 0 && width <= 0 && left < 0 && top < 0) {
    	Window_PopWindow.moveTo(0,0);
		Window_PopWindow.resizeTo(screen.availWidth,screen.availHeight);
		Window_PopWindow.outerWidth=screen.availWidth;
		Window_PopWindow.outerHeight=screen.availHeight;
    }

	return Window_PopWindow;
}

//根据数组中元素的内容删除该元素		
Array.prototype.indexOf = function(val) {
   for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
   }
       return -1;
  };
 Array.prototype.remove = function(val) {
   var index = this.indexOf(val);
   if (index > -1) {
      this.splice(index, 1);
   }
 };