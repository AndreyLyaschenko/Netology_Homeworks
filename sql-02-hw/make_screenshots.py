from pathlib import Path
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parent
OUTPUT = ROOT / "screenshots"
OUTPUT.mkdir(exist_ok=True)

FONT = "/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf"

for number in range(1, 6):
    name = f"task_{number:02d}"
    sql = (ROOT / "sql" / f"{name}.sql").read_text()
    result = (ROOT / "results" / f"{name}.txt").read_text()

    lines = (
        [f"SQL. Часть 2 — Задание {number}", ""]
        + ["SQL-запрос:", ""]
        + sql.splitlines()
        + ["", "Результат выполнения:", ""]
        + result.splitlines()
    )

    font = ImageFont.truetype(FONT, 18)
    line_height = 29
    width = max(1100, max(len(line) for line in lines) * 12 + 80)
    height = max(350, len(lines) * line_height + 80)

    image = Image.new("RGB", (width, height), "#171b24")
    draw = ImageDraw.Draw(image)

    for index, line in enumerate(lines):
        draw.text(
            (40, 35 + index * line_height),
            line,
            font=font,
            fill="#e5e7eb",
        )

    path = OUTPUT / f"{name}.png"
    image.save(path)
    print(f"Создан: {path}")
