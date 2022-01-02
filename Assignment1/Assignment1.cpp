#include <iostream>
#include <fstream>

#include "Assignment1.h"

using namespace std;

Assignment1::Assignment1(string filename){
	file = filename;
}

void Assignment1::question1(){
	ifstream inputFile;
	inputFile.open(file, ios::in);
	int state = 0;
	int index = 1;
	char letter = ' ';
	bool match = false;
	cout << "Question 1:";
	while ((letter = inputFile.get()) != EOF){
		if(state == 0){
			if(letter == 'a'){
				state = 1;
			}
		}
		else if(state == 1){
			if(letter == 'b'){
				state = 2;
			}
			else if(letter != 'a'){
				state = 0;
			}
		}
		else if(state == 2){
			if(letter == 'a'){
				state = 3;
			}
			else{
				state = 0;
			}
		}
		else if(state == 3){
			if(letter == 'b'){
				state = 4;
				cout << " " << index;
				match = true;
			}
			else if(letter == 'a'){
				state = 1;
			}
			else{
				state = 0;
			}
		}
		else if(state == 4){
			if(letter == 'a'){
				state = 3;
			}
			else{
				state = 0;
			}
		}
		index++;
	}
	if(!match){
		cout << " No Matches";
	}
	cout << endl;
	inputFile.close();
}

void Assignment1::question2(){
	ifstream inputFile;
	inputFile.open(file, ios::in);
	int state = 0;
	int index = 1;
	char letter = ' ';
	bool match = false;
	cout << "Question 2:";
	while ((letter = inputFile.get()) != EOF){
		if(state == 0){
			if(letter == 'a'){
				state = 1;
			}
		}
		else if(state == 1){
			if(letter == 'b'){
				state = 2;
			}
			else if(letter != 'a'){
				state = 0;
			}
		}
		else if(state == 2){
			if(letter == 'c'){
				state = 3;
			}
			else if(letter == 'a'){
				state = 1;
			}
			else{
				state = 0;
			}
		}
		else if(state == 3){
			if(letter == 'c'){
				state = 4;
			}
		}
		else if(state == 4){
			if(letter == 'b'){
				state = 5;
			}
			else if(letter != 'c')
			{
				state = 3;
			}
		}
		else if(state == 5)
		{
			if(letter == 'a'){
				state = 6;
				cout << " " << index;
				match = true;
			}
			else if(letter == 'c'){
				state = 4;
			}
			else{
				state = 3;
			}
		}
		else if(state == 6){
			if(letter == 'c'){
				state = 4;
			}
			else{
				state = 3;
			}
		}
		index++;
	}
	if(!match){
		cout << " No Matches";
	}
	cout << endl;
	inputFile.close();
}

void Assignment1::question3(){
	ifstream inputFile;
	inputFile.open(file, ios::in);
	int state = 0;
	int index = 1;
	char letter = ' ';
	bool match = false;
	cout << "Question 3:";
	while ((letter = inputFile.get()) != EOF){
		if(state == 0){
			if(letter == 'a'){
				state = 1;
			}
		}
		else if(state == 1){
			if(letter == 'a'){
				state = 2;
				cout << " " << index;
				match = true;
			}
			else if(letter == 'b'){
				state = 3;
			}
			else{
				state = 0;
			}
		}
		else if(state == 2){
			if(letter == 'a'){
				cout << " " << index;
				match = true;
			}
			else if(letter == 'b'){
				state = 3;
			}
			else{
				state = 0;
			}
		}
		else if(state == 3){
			if(letter == 'b'){
				state = 4;
				cout << " " << index;
				match = true;
			}
			else if(letter == 'a'){
				state = 1;
			}
			else{
				state = 0;
			}
		}
		else if(state == 4){
			if(letter == 'a'){
				state = 1;
			}
			else{
				letter = 0;
			}
		}
		index++;
	}
	if(!match){
		cout << " No Matches";
	}
	cout << endl;
	inputFile.close();
}
