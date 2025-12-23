#let part_counter = counter("exam-part")
#let sub_counter  = counter("exam-sub")

#let sub(points, text) = (
  kind: "sub",
  points: points,
  text: text,
)

#let part(points: none, title, ..items) = {
  let arr = items.pos()
  let subs = arr.filter(it =>
    type(it) == dictionary and ("kind" in it) and it.kind == "sub"
  )

  let shown_points = if subs.len() > 1 { subs.map(s => s.points).sum() }
  else if subs.len() == 0 and points != none { points }
  else { none }

  block(
    breakable: false,
    width: 100%,
  )[
    #part_counter.step()
    #sub_counter.update(0)

    #context part_counter.display("一")、
    #if shown_points != none { [[#shown_points 分]] }
    #title

    #v(6pt)

    #for it in arr {
      if type(it) == dictionary and ("kind" in it) and it.kind == "sub" {
        [
          #sub_counter.step()
          （#context sub_counter.display("1")）#it.text \
          #align(right)[[#it.points 分]]
          #v(4pt)
        ]
      } else {
        [ #it #v(4pt) ]
      }
    }

    #v(5%)
  ]
  
  v(1fr, weak: true)
}

#let exam(body, year: 2026) = {
  let school = [南方科技大学]
  let paper-title = [#(year)年招收攻读硕士学位研究生入学统一考试试题]
  let subject-code = [825]
  let subject = [自动控制原理]

  set document(
    author: "dokee.moe",
    title: "SUSTech-Entrance-Exam-AutoControl-" + str(year),
  )

  set page(
    paper: "a4",
    margin: (top: 30mm, bottom: 45mm, x: 25mm),
    footer: context [
      #line(length: 100%, stroke: 0.6pt)
      #v(3pt)
      科目名称：#subject
      #h(1fr)
      第 #counter(page).get().first() 页 ~ 共 #counter(page).final().first() 页
    ],
  )

  set text(
    lang: "zh",
    region: "cn",
    font: ((name: "Noto Serif CJK SC", covers: "latin-in-cjk"), "Times New Roman"),
    size: 12pt,
  )
  set strong(delta: 200)
  set math.mat(delim: "[", column-gap: 0.6em, row-gap: 0.25em)
  set math.vec(delim: "[", gap: 0.25em)
  show math.equation.where(block: false): it => {
    set text(top-edge: "bounds", bottom-edge: "bounds")
    text(baseline: -0.05em)[#math.display(it)]
  }
  show math.equation: set text(
    font: "Latin Modern Math",
    stylistic-set: 03,
  )

  [
    #align(center)[
      #text(size: 22pt, weight: "medium")[#school]
      #v(4pt)
      #text(size: 18pt, weight: "medium")[#paper-title]
      #v(4pt)
      #text(size: 14pt)[
        *科目代码：*[#subject-code]
        #h(1fr)
        *科目名称：*#subject
      ]
    ]

    #v(4pt)

    #text[
    *考生须知：*\
    + 本试卷满分150分，考试时间180分钟。\
    + 所有答案必须写在答题纸上，写在试题纸上或草稿纸上一律无效。
    ]

    #line(length: 100%, stroke: 0.6pt)

    #v(10pt)

    #body
  ]
}
