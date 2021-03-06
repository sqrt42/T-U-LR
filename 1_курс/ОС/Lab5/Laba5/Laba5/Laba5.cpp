#include "stdafx.h"
#include <stdio.h>
#include <stdlib.h>
#include <io.h>
#include <iostream>
#include <fstream>
#include <string>
#include <ctime>
#include <experimental/filesystem>
#include <vector>
#include <iterator>
#define _CRT_SECURE_NO_WARNINGS  
using namespace std;
namespace fs = std::experimental::filesystem;	

int main(void) {
	intptr_t hFile;
	struct _finddata_t file;
	ofstream outfile("laba5.txt");
	char date[26] = {};
	time_t now = time(0);
	ctime_s(date, 26, &now);
	outfile << date << endl;
	if ((hFile = _findfirst(".", &file)) == -1L) {
		cerr << "Whoops, can't open directory" << endl;
	} else {
		do {
			outfile << file.name << endl;
		} while (_findnext(hFile, &file) == 0);
	}
 	outfile.close();
}



