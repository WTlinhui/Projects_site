# mail_parser.py
import re

PROJECT_KEYWORDS = [
    "概要", "勤務地","場所", "人数", "期間", "時期", "工程", "スキル", "備考", "その他", "案件"
]

def split_projects_from_text(text):
    # いろんな線パターンで分割
    blocks = re.split(r'[-ー_*~]{5,}', text)  # 5回以上の記号連続で分割

    projects = []
    for block in blocks:
        block = block.strip()
        if not block:
            continue

        # 案件番号の区切りも分割
        sub_blocks = re.split(r'\[案件\d+\]|【案件\d+】', block)

        for sub_block in sub_blocks:
            sub_block = sub_block.strip()
            if not sub_block:
                continue

            count = sum(keyword in sub_block for keyword in PROJECT_KEYWORDS)
            if count >= 3:
                projects.append(sub_block)

    return projects