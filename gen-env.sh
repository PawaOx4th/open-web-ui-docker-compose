#!/bin/bash

# Script สำหรับแปลง .env เป็น .env.example
# Usage: ./convert_env.sh [input_file] [output_file]

# ตั้งค่าไฟล์ default
INPUT_FILE="${1:-.env}"
OUTPUT_FILE="${2:-.env.example}"

# ตรวจสอบว่าไฟล์ input มีอยู่หรือไม่
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: ไฟล์ $INPUT_FILE ไม่พบ"
    exit 1
fi

# สร้างไฟล์ .env.example
echo "กำลังแปลง $INPUT_FILE เป็น $OUTPUT_FILE..."

# อ่านไฟล์ .env และแปลงเป็น .env.example
sed 's/=.*/=/' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "แปลงสำเร็จ! ไฟล์ $OUTPUT_FILE ถูกสร้างแล้ว"

# แสดงผลลัพธ์
echo ""
echo "ตัวอย่างเนื้อหาในไฟล์ $OUTPUT_FILE:"
echo "----------------------------------------"
head -10 "$OUTPUT_FILE"
if [ $(wc -l < "$OUTPUT_FILE") -gt 10 ]; then
    echo "..."
    echo "(แสดงเฉพาะ 10 บรรทัดแรก)"
fi