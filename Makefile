all: html pdf docx rtf

pdf: resume.pdf
resume.pdf: README.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex README.md; \
	context resume.tex

html: resume.html
resume.html: style_chmduquesne.css README.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o resume.html README.md

docx: resume.docx
resume.docx: README.md
	pandoc -s -S README.md -o resume.docx

rtf: resume.rtf
resume.rtf: README.md
	pandoc -s -S README.md -o resume.rtf

clean:
	rm resume.html
	rm resume.tex
	rm resume.tuc
	rm resume.log
	rm resume.pdf
	rm resume.docx
	rm resume.rtf
