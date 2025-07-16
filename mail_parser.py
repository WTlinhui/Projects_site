# mail_parser.py
import re

PROJECT_KEYWORDS = [
    "概要", "勤務地","場所", "人数", "期間", "時期", "工程", "スキル", "備考", "その他", "案件"
]

def split_projects_from_text(text):
    # 1. 署名部分（末尾）を除去：行頭の「-----」や「ーーー」などの線で判定
    signature_split = re.split(r'(?m)^\s*[―-]{3,}\s*$', text.strip())
    text_without_signature = signature_split[0]  # 最初の部分のみ使う

    # 2. 案件単位で分割
    split_pattern = r'\[案件\d+\]|【案件\d+】'
    raw_projects = re.split(split_pattern, text_without_signature)

    # 3. 有効な案件のみフィルタ（キーワード2個以上含む）
    projects = []
    for block in raw_projects:
        block = block.strip()
        if not block:
            continue
        count = sum(keyword in block for keyword in PROJECT_KEYWORDS)
        if count >= 3:
            projects.append(block)
    
    return projects
