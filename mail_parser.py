# mail_parser.py
import re

PROJECT_KEYWORDS = [
    "概要", "勤務地", "人数", "期間", "工程", "スキル", "要員像", "その他", "案件"
]

def split_projects_from_text(text):
    split_pattern = r'\[案件\d+\]|【案件\d+】'
    raw_projects = re.split(split_pattern, text)
    
    projects = []
    for block in raw_projects:
        block = block.strip()
        if not block:
            continue
        count = sum(keyword in block for keyword in PROJECT_KEYWORDS)
        if count >= 2:  # キーワードが2つ以上含まれているか判定
            projects.append(block)
    
    return projects
