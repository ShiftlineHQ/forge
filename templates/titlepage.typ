/* Title Page
   [title] - Work title
   [authors] - Work authors
   [teachers] - Teachers or others ([position])
   [date] - Document creation date
   [education] - Organization name
   [department] - Faculty or institute
   [position] - Teacher position
   [documentName] - Document name (e.g. "LAB REPORT")
   [group] - Group name
   [city] - City
   [object] - Subject/course
*/
#let titlepage(
  title: "",
  authors: (),
  teachers: (),
  date: datetime.today(),
  education: "University Name",
  department: "Faculty",
  position: "teacher",
  documentName: "LAB REPORT",
  group: "GROUP",
  city: "CITY",
  object: "SUBJECT",
) = {
  set text(font: "Times New Roman", size: 12pt, lang: "ru", hyphenate: false)
  set page(
    margin: (right: 15mm, left: 15mm, top: 20mm, bottom: 20mm),
    paper: "a4",
  )
  align(center, education)
  align(center, department)

  align(left, stack(dir: ltr, "REPORT\nACCEPTED WITH GRADE", align(bottom, line(
    length: 80pt,
    start: (5pt, 0pt),
  ))))
  v(5pt)
  align(left, "TEACHER")
  grid(
    columns: (1.5fr, 1fr, 1.5fr),
    row-gutter: 3pt,
    column-gutter: 10pt,
    align(center, position), "", align(center, teachers.join(", ")),
    line(length: 100%), line(length: 100%), line(length: 100%),
    align(center, text(0.9em, "position, degree, title")),
    align(center, text(0.9em, "signature, date")),
    align(center, text(0.9em, "initials, surname")),
  )


  v(3fr)
  align(center, text(upper(documentName), size: 1.23em))
  v(0.8fr)
  align(center, stack(dir: ttb, text(title, size: 1.2em), v(5pt), align(
    bottom,
    line(length: 0%),
  )))
  v(0.8fr)
  align(center)[Course:]
  align(center)[#object]
  v(3fr)
  grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 10pt,
    row-gutter: 3pt,
    grid.cell([WORK DONE BY], colspan: 2), text(2.5em, ""), "",

    "STUDENT Group #", align(center, group), "", align(center, authors.join(", ")),
    line(length: 0%),
    line(length: 100%),
    line(length: 100%),
    line(length: 100%),
    grid.cell(text(0.9em, ""), colspan: 2),
    align(center + top, text(0.9em, "signature, date")),
    align(center, text(0.9em, "initials, surname")),
  )
  v(3fr)
  align(center, stack(dir: ltr, city, h(10pt), str(date.year())))
}