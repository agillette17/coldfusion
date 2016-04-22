function passCount(input1,input2,input3)
	{ 
		if (input1 < 3 || input1 > 1000 || input2 < 3 || input2 > 1000) {
			return -1;
		}
		var arr = new Array(input1+1).join('0').split('').map(parseFloat);
		var over = 0;
		var currPos = 1;
		var i = 0;
		arr[currPos-1] = 1;
		input3 = input3 % input1;
		while (over === 0) {
			if (arr[currPos-1] % 2 === 0) {
				currPos = currPos + input3;
				if (currPos > 5) {
					currPos = currPos % input1;
				}
			} else {
				currPos = currPos - input3;
				if (currPos <= 0) {
					currPos = currPos + input1;
				}
			}
			arr[currPos-1] = arr[currPos-1] + 1;
			for (var idx = 0; idx < arr.length; idx++) {
				if (arr[idx] === input2) {
					over = 1;
				}
			}
			i++;
		}
		return i;
	} 
