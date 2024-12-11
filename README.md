# steghide-extractor

## Overview
This script automates the process of extracting hidden data from files using `steghide`. During my Intro to Digital Forensics course by Security Blue Team, I found it tedious to run `steghide` commands manually for each file and password. To save time, I created this Bash script to streamline the process.

I developed `extract_flags.sh` specifically for the Stenography Activity in the course that required me to try 3 different passwords on 7 files to find the flags.
Then I relised I would have a more enhanced version so I could use it whenever I felt it would save me more time so I developed `extract_steghide.sh`; which allows users to:
- Specify the directory containing the files to analyze.
- Use custom password lists or fallback to default ones.
- Displays the content of extracted files.

## Features
1. Batch processing of files in a directory.
2. Multiple passwords are tried for each file.
3. Logs the success or failure of extraction attempts.
4. Displays the content of extracted files automatically.

## Usage
### Prerequisites
Ensure `steghide` is installed on your system:
```bash
sudo apt install steghide
```
### Running the Script:
#### 1. Clone the repository:
```bash
git clone https://github.com/N-r0bin/steghide-extractor.git
cd steghide-extractor-main
```
#### 2. Make the script executable:
```bash
chmod +x extract_steghide.sh

```
#### 3. Execute the script:
- To process files in the current directory with default passwords:
 ```bash
./extract_steghide.sh .
```
- To specify a directory and custom passwords:
 ```bash
./extract_steghide.sh /path/to/directory "password1,password2,password3"
```
Example: 
```bash
./extract_steghide.sh ~/Downloads "password123,letmein,opensesame"
```

### Notes:
- If no directory is specified, the script will process the current directory (.).
- If no passwords are specified, it will use the default list: christmastree, darksky123, goldenwatch.
