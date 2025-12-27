#import "@preview/cetz:0.4.2" as c
#import "template.typ": *

#show: exam.with(year: 2025)

// 1
#part(
  [考虑具有如下动态方程的系统：],
  $ dot(x) &= mat(1, 2; 2, 1) x + vec(0, 1) u \
    y &= mat(1, 0) x
  $,
  sub(8, [判断系统的可控性和可观性，并给出理由。]),
  sub(7, [已知输入 $u(t)$ 为阶跃信号，初始状态 $x(0) = vec(0, 1)$，求输出 $y$。]),
)

// 2
#part(
  points: 15,
  [考虑 $n$ 维线性定常系统 $dot(x) = A x + b u$。证明以下两个条件等价（即可控性判据）：],
  [（1）可控矩阵（能控判别矩阵） $C = mat(b, A b, dots, A^(n - 1) b)$ 的秩为 $n$。],
  [（2）对任意复数 $lambda$，矩阵 $mat(lambda I - A, b) $ 的秩为 $n$（PBH 判据）。],
)

// 3
#part(
  [考虑如下线性定常系统：],
  $ dot(x) &= mat(0, 2; -3, 5) x + vec(1, 0) u, \
    y &= mat(1, 0) x
  $,
  [请回答以下问题：],
  sub(8, [求系统的状态转移矩阵 $phi.alt(t) = "e"^(A t)$。]),
  sub(7, [设计状态反馈控制器 $u = -K x$，给出一个 $K$ 使闭环系统渐近稳定，并说明理由。]),
)

// 4
#part(
  points: 15,
  [确定@fig4 所示控制系统的传递函数 $(C(s)) / (R(s))$。],
  [
    #figure[
      #set text(size:10pt)
      #ctrl-diagram(

        let In    = (-0.5, 0),
        let TapIn = (0.6, 0),
        let Sum0  = (1.2, 0),

        let G1    = (2.2, 0),
        let Sum1  = (3.2, 0),

        let G2    = (4.2, 0),
        let Sum2  = (5.2, 0),

        let G4    = (6.3, 0),
        let Tap4  = (7.2, 0),

        let G5    = (8.2, 0),
        let Bfb   = (9.1, 0),

        let G6    = (10.1, 0),
        let Out   = (11.5, 0),

        let Top_y = -1,
        let Jtop  = (Sum2.at(0), Top_y),
        let G3    = (Sum1.at(0), Top_y),
        let H1    = (Tap4.at(0), Top_y),

        let H2    = (Sum2.at(0), 1),
        let H3    = (Sum2.at(0), 2),

        sum-node(Sum0, name: <Sum0>),
        sum-node(Sum1, name: <Sum1>),
        sum-node(Sum2, name: <Sum2>),

        block-node(G1, name: <G1>)[$ G_1(s) $],
        block-node(G2, name: <G2>)[$ G_2(s) $],
        block-node(G3, name: <G3>)[$ G_3(s) $],
        block-node(G4, name: <G4>)[$ G_4(s) $],
        block-node(G5, name: <G5>)[$ G_5(s) $],
        block-node(G6, name: <G6>)[$ G_6(s) $],

        block-node(H1, name: <H1>)[$ H_1(s) $],
        block-node(H2, name: <H2>)[$ H_2(s) $],
        block-node(H3, name: <H3>)[$ H_3(s) $],

        f.edge(In, TapIn, <Sum0>, "-}>", label-pos: 0, label-side: left)[$ R(s) $],
        f.edge(<Sum0>, <G1>, "-}>"),
        f.edge(<G1>, <Sum1>, "-}>"),
        f.edge(<Sum1>, <G2>, "-}>"),
        f.edge(<G2>, <Sum2>, "-}>"),
        f.edge(<Sum2>, <G4>, "-}>"),
        f.edge(<G4>, Tap4, <G5>, "-}>"),
        f.edge(<G5>, Bfb, <G6>, "-}>"),
        f.edge(<G6>, Out, "-}>", label-pos: 1, label-side: left)[$ C(s) $],

        let top_ref = (0, Top_y),
        let a = (TapIn, "|-", <G3>),
        f.edge(TapIn, a, <G3>, "-}>"),
        f.edge(<G3>, Jtop, "-"),
        f.edge(Jtop, <Sum2>, "-}>"),

        let b = (Bfb, "|-", <H1>),
        f.edge(Bfb, b, <H1>, "-}>"),
        f.edge(<H1>, Jtop, "-"),

        let c1 = (Tap4, "|-", <H2>),
        f.edge(Tap4, c1, <H2>, "-}>"),
        let c2 = (<H2>, "-|", <Sum1>),
        f.edge(<H2>, c2, <Sum1>, "-}>"),

        let d1 = (Bfb, "|-", <H3>),
        f.edge(Bfb, d1, <H3>, "-}>"),
        let d2 = (<H3>, "-|", <Sum0>),
        f.edge(<H3>, d2, <Sum0>, "-}>"),

        sym-node("-", <Sum0>, anchor: "south"),
        sym-node("-", <Sum1>, anchor: "south"),
        sym-node("-", <Sum2>, anchor: "north"),
      )
    ] <fig4>
  ],
)

#pagebreak

// 5
#part(
  points: 15,
  [已知单位负反馈系统的开环传递函数为：],
  $ G(s) = K / ( s (1 + 0.1 s) (1 + 0.25 s) ) $,
  [要求闭环特征方程的全部根均位于直线 $s = -1$ 的左侧，试确定增益 $K$ 的取值范围。],
)

// 6
#part(
  [已知单位负反馈系统的开环传递函数为：],
  $ G(s) H(s) = K (s + 1) / ( s (s + 2) (s + 3) ) $,
  sub(8, [画出系统以 $K$ 为参数的根轨迹。]),
  sub(7, [当输入为斜坡信号 $r(t) = t$ 时，要求稳态误差满足 $e_"ss" <= 0.2$ 且系统处于欠阻尼状态，求此时 $K$ 的取值范围。]),
)

// 7
#part(
  points: 15,
  [已知单位负反馈系统的开环传递函数为：],
  $ G(s) = (2 (s + 3)) / ( s (s - 1) ) $,
  [请画出系统的奈奎斯特图，并用奈奎斯特判据判断闭环系统的稳定性；同时确定闭环系统不稳定极点的个数。],
)

// 8
#part(
  points: 15,
  [某控制系统的功率放大环节具有如@fig8 所示的非线性限幅特性。
  设限幅值为 $plus.minus 2$，系统初始条件为零，参考输入为 $r(t) = 4 times 1(t)$。
  请在相平面 $x, dot(x) = "e"$ 上绘制系统的相轨迹示意图。],
  [
    #figure[
      #ctrl-diagram(
        let In   = (0, 0),
        let Sum0 = (1.5, 0),
        let Split = (2.2, 0),

        let Int  = (3.4, 0),
        let Sum1 = (4.6, 0),

        let Nl   = (6.0, 0),
        let P    = (7.6, 0),

        let Bfb  = (9.0, 0),
        let Out  = (10.2, 0),

        let K    = (3.4, -0.75),

        let Fb_y = 1,

        sum-node(Sum0, name: <Sum0>),
        sum-node(Sum1, name: <Sum1>),

        block-node(Int, name: <Int>)[$ 1 / s $],
        block-node(K, name: <K>)[$ 0.75 $],
        block-node(Nl, name: <Nl>)[
          #scale(50%, reflow: true)[
            #c.canvas(length: 7mm, {
              import c.draw: *

              let axis   = (paint: black, thickness: 0.9pt)
              let func   = (paint: black, thickness: 1.2pt)
              let helper = (paint: black, thickness: 0.6pt, dash: (2pt, 2pt))

              // x轴（带箭头）
              line(
                (-3.2, 0), (3.4, 0),
                stroke: axis,
                mark: (end: (symbol: ">", fill: black, stroke: auto)),
              )

              // y轴（带箭头）
              line(
                (0, -2.8), (0, 3),
                stroke: axis,
                mark: (end: (symbol: ">", fill: black, stroke: auto)),
              )

              // (2,2) 的虚线辅助线
              line((0, 2), (2, 2), stroke: helper)
              line((2, 0), (2, 2), stroke: helper)

              // 分段折线：y=-1 (x<=-1), y=x (-1..2), y=2 (x>=2)
              line((-3, -2), (-2, -2), (2, 2), (3, 2), stroke: func)

              // 标注 “2”
              content((2, -0.15), [2], anchor: "north")
              content((-0.15, 2), [2], anchor: "east")
            })
          ]
        ],
        block-node(P, name: <P>)[$ 4 / (s + 1) $],

        f.edge(In, <Sum0>, "-}>", label-pos: 0, label-side: left)[$ r $],
        f.edge(<Sum0>, Split, "-", label-pos: 0.5, label-side: left)[$ e $],
        f.edge(Split, <Int>, "-}>"),
        f.edge(<Int>, <Sum1>, "-}>", label-pos: 0.5, label-side: left)[$ x $],
        f.edge(<Sum1>, <Nl>, "-}>"),
        f.edge(<Nl>, <P>, "-}>", label-pos: 0.5, label-side: left)[$ u $],
        f.edge(<P>, Bfb, Out, "-}>", label-pos: 1, label-side: left)[$ c $],

        let p1 = (Split, "|-", <K>),
        f.edge(Split, p1, <K>, "-}>"),
        let p2 = (<K>, "-|", <Sum1>),
        f.edge(<K>, p2, <Sum1>, "-}>"),

        let fb_ref = (0, Fb_y),
        let q1 = (Bfb, "|-", fb_ref),
        let q2 = (q1, "-|", <Sum0>),
        f.edge(Bfb, q1, q2, <Sum0>, "-}>"),

        sym-node("-", <Sum0>, anchor: "south"),
      )
    ] <fig8>
  ],
)

// 9
#part(
  [已知离散系统的结构图如@fig9 所示：],
  [
    #figure[
      #ctrl-diagram(
        let In    = (0, 0),
        let Sum0  = (1.5, 0),

        let SwL   = (2.45, 0),
        let SwR   = (3.05, 0),
        let SwArm = (2.95, -0.2),

        let Delay = (4.1, 0),
        let Plant = (5.7, 0),

        let Bfb   = (7.0, 0),
        let Out   = (8.5, 0),

        let Fb_y  = 0.8,

        sum-node(Sum0, name: <Sum0>),
        block-node(Delay, name: <D>)[$ upright(e)^(-T s) $],
        block-node(Plant, name: <G>)[$ 5 / (s(s + 5)) $],

        f.edge(In, <Sum0>, "-}>", label-pos: 0, label-side: left)[$ R(s) $],

        f.edge(<Sum0>, SwL, "-"),

        f.edge(SwL, SwArm, "-"),
        f.edge(SwR, <D>, "-}>"),

        f.edge(<D>, <G>, "-}>"),
        f.edge(<G>, Bfb, Out, "-}>", label-pos: 1, label-side: left)[$ C(s) $],

        let fb_ref = (0, Fb_y),
        let fb1 = (Bfb, "|-", fb_ref),
        let fb2 = (fb1, "-|", <Sum0>),
        f.edge(Bfb, fb1, fb2, <Sum0>, "-}>"),

        sym-node("-", <Sum0>, anchor: "south"),
      )
    ] <fig9>
  ],
  sub(8, [求系统的离散闭环脉冲传递函数。]),
  sub(7, [当系统输入为单位阶跃信号、采样周期 $T = 0.02$ 时，求系统的离散输出序列 $y[k]$。]),
)

// 10
#part(
  [已知系统的方框图如@fig10 所示。要求设计 PID 控制器：],
  $ C(s) = K_p + K_i / s + K_d s $,
  [使得校正后的系统闭环特征方程为：],
  $ (s + 10) (s^2 + 4 s + 8) = 0 $,
  [
    #figure[
      #ctrl-diagram(
        let In    = (0, 0),
        let Sum0  = (1.5, 0),
        let Split = (2.5, 0),

        let Kp = (3.5, -0.8),
        let Ki = (3.5,  0.0),
        let Kd = (3.5,  0.8),

        let Sum1  = (4.5, 0),
        let Plant = (5.8, 0),

        let Bfb = (7, 0),
        let Out = (8.5, 0),

        let Fb_y = 1.5,

        sum-node(Sum0, name: <Sum0>),
        sum-node(Sum1, name: <Sum1>),

        block-node(Kp, name: <Kp>)[$ K_p $],
        block-node(Ki, name: <Ki>)[$ K_i / s $],
        block-node(Kd, name: <Kd>)[$ K_d s $],

        block-node(Plant, name: <G>)[$ 10 / (s(s + 2)(s + 5)) $],

        f.edge(In, <Sum0>, "-}>", label-pos: 0, label-side: left)[$ R(s) $],
        f.edge(<Sum0>, Split, "-"),

        let sp_kp = (Split, "|-", <Kp>),
        f.edge(Split, sp_kp, <Kp>, "-}>"),
        f.edge(Split, <Ki>, "-}>"),
        let sp_kd = (Split, "|-", <Kd>),
        f.edge(Split, sp_kd, <Kd>, "-}>"),

        let kp_to_sum = (<Kp>, "-|", <Sum1>),
        f.edge(<Kp>, kp_to_sum, <Sum1>, "-}>"),
        f.edge(<Ki>, <Sum1>, "-}>"),
        let kd_to_sum = (<Kd>, "-|", <Sum1>),
        f.edge(<Kd>, kd_to_sum, <Sum1>, "-}>"),

        f.edge(<Sum1>, <G>, "-}>"),
        f.edge(<G>, Bfb, Out, "-}>", label-pos: 1, label-side: left)[$ C(s) $],

        let fb_ref = (0, Fb_y),
        let fb1 = (Bfb, "|-", fb_ref),
        let fb2 = (fb1, "-|", <Sum0>),
        f.edge(Bfb, fb1, fb2, <Sum0>, "-}>"),

        sym-node("-", <Sum0>, anchor: "south"),
      )
    ] <fig10>
  ],
  sub(8, [计算 PID 控制器参数 $K_p$、$K_i$、$K_d$。]),
  sub(7, [校正后系统的主导极点是什么？并说明其成为主导极点的原因。]),
)

