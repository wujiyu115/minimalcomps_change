minimalcomps_change
===================

ui库学习demo.

bug:  minimalcomps ScrollPane第一次设置20个项目时，重新设置项目个数，只显示20个
solution: // 当滚动面板里面的内容改变时需要手动更新
			_compsPanel.update();