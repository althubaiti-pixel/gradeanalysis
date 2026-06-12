<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>أداة تحليل نتائج المقررات — الكلية التقنية بميسان</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@300;400;500;600;700;900&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
<style>
  :root {
    /* لوحة الألوان المؤسسية المستخرجة من الهوية */
    --teal: #22B9B0;
    --teal-deep: #168f88;
    --teal-darker: #0e6b66;
    --teal-header: #0c4f4c;
    --slate: #528CA0;
    --sky: #12BCCD;
    --green: #A9D6AF;
    --green-soft: #c9e6cd;

    --paper: #f5f8f8;
    --paper-card: #ffffff;
    --line: #dce6e6;
    --ink: #16302e;
    --ink-soft: #3f5a58;
    --ink-mute: #7b918f;

    --warn: #c8902f;
    --bad: #b8503f;
    --good: #2d7d6f;
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }
  html { scroll-behavior: smooth; }

  body {
    font-family: 'Cairo', sans-serif;
    background: var(--paper);
    color: var(--ink);
    line-height: 1.85;
    font-size: 16px;
  }

  .container {
    max-width: 1080px;
    margin: 0 auto;
    padding: 0 1.5rem 4rem;
  }

  /* ============ رأس الأداة المؤسسي ============ */
  .masthead {
    background: linear-gradient(135deg, var(--teal-header) 0%, var(--teal-darker) 100%);
    color: #fff;
    margin-bottom: 2.5rem;
    position: relative;
    overflow: hidden;
  }
  .masthead::after {
    content: '';
    position: absolute;
    inset: 0;
    background:
      radial-gradient(circle at 88% 20%, rgba(34,185,176,0.25) 0%, transparent 45%),
      radial-gradient(circle at 12% 90%, rgba(18,188,205,0.18) 0%, transparent 45%);
    pointer-events: none;
  }
  .masthead-inner {
    max-width: 1080px;
    margin: 0 auto;
    padding: 1.75rem 1.5rem;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1.5rem;
    position: relative;
    z-index: 2;
    flex-wrap: wrap;
  }
  .masthead-text h1 {
    font-size: 1.5rem;
    font-weight: 700;
    line-height: 1.4;
    margin-bottom: 0.25rem;
  }
  .masthead-text .college {
    font-size: 1rem;
    font-weight: 500;
    color: var(--green);
  }
  .masthead-text .org {
    font-size: 0.82rem;
    font-weight: 300;
    color: rgba(255,255,255,0.75);
    margin-top: 0.15rem;
  }
  .masthead-logo {
    background: rgba(255,255,255,0.06);
    border: 1px solid rgba(255,255,255,0.1);
    border-radius: 10px;
    padding: 0.7rem 1rem;
  }
  .masthead-logo img {
    height: 56px;
    width: auto;
    display: block;
  }

  .subbar {
    background: rgba(0,0,0,0.18);
    border-top: 1px solid rgba(255,255,255,0.08);
    position: relative;
    z-index: 2;
  }
  .subbar-inner {
    max-width: 1080px;
    margin: 0 auto;
    padding: 0.6rem 1.5rem;
    display: flex;
    justify-content: space-between;
    font-size: 0.78rem;
    color: rgba(255,255,255,0.8);
    flex-wrap: wrap;
    gap: 0.5rem;
  }
  .subbar-inner .designer span { color: var(--green); font-weight: 600; }

  /* ============ مقدمة ============ */
  .intro {
    background: var(--paper-card);
    border: 1px solid var(--line);
    border-right: 4px solid var(--teal);
    border-radius: 6px;
    padding: 1.75rem 2rem;
    margin-bottom: 2.5rem;
  }
  .intro p {
    color: var(--ink-soft);
    font-size: 1rem;
    margin-bottom: 0.5rem;
  }
  .intro p:last-child { margin-bottom: 0; }
  .intro strong { color: var(--ink); font-weight: 700; }

  /* ============ عناوين الأقسام ============ */
  .section { margin-bottom: 3rem; }
  .section-head {
    display: flex;
    align-items: center;
    gap: 0.9rem;
    margin-bottom: 1.25rem;
  }
  .section-head .idx {
    background: var(--teal);
    color: #fff;
    width: 34px;
    height: 34px;
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'JetBrains Mono', monospace;
    font-weight: 500;
    font-size: 0.95rem;
    flex-shrink: 0;
  }
  .section-head h2 {
    font-size: 1.4rem;
    font-weight: 700;
    color: var(--ink);
  }
  .section-intro {
    color: var(--ink-soft);
    font-size: 0.98rem;
    margin-bottom: 1.5rem;
    max-width: 760px;
  }

  /* ============ الأداة الرئيسية: المحلل ============ */
  .analyzer {
    background: var(--paper-card);
    border: 1px solid var(--line);
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 4px 20px -8px rgba(14,107,102,0.12);
  }
  .analyzer-inputs {
    display: grid;
    grid-template-columns: 1fr;
    gap: 0;
  }
  @media (min-width: 640px) {
    .analyzer-inputs { grid-template-columns: 1fr 1fr 1fr; }
    .analyzer-inputs.four { grid-template-columns: 1.4fr 1fr 1fr 1fr; }
  }
  .ainput {
    padding: 1.5rem;
    border-bottom: 1px solid var(--line);
    border-left: 1px solid var(--line);
  }
  .ainput:last-child { border-left: none; }
  .ainput label {
    display: block;
    font-size: 0.9rem;
    font-weight: 600;
    color: var(--ink);
    margin-bottom: 0.2rem;
  }
  .ainput .hint {
    font-size: 0.76rem;
    color: var(--ink-mute);
    margin-bottom: 0.6rem;
  }
  .ainput input, .ainput select {
    width: 100%;
    padding: 0.65rem 0.8rem;
    border: 1px solid var(--line);
    border-radius: 6px;
    background: var(--paper);
    font-family: 'Cairo', sans-serif;
    font-size: 1.05rem;
    color: var(--ink);
    outline: none;
    transition: border 0.2s, box-shadow 0.2s;
  }
  .ainput input[type="number"] {
    font-family: 'JetBrains Mono', monospace;
    direction: ltr;
    text-align: center;
  }
  .ainput input:focus, .ainput select:focus {
    border-color: var(--teal);
    box-shadow: 0 0 0 3px rgba(34,185,176,0.12);
  }

  .analyzer-result {
    padding: 0;
    display: none;
  }
  .analyzer-result.show { display: block; }

  .verdict-bar {
    padding: 1.5rem 2rem;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1rem;
    flex-wrap: wrap;
    transition: background 0.4s;
  }
  .verdict-bar .vtext { font-size: 1.2rem; font-weight: 700; }
  .verdict-bar .vsub { font-size: 0.88rem; font-weight: 400; opacity: 0.92; margin-top: 0.15rem; }
  .verdict-bar .vbadge {
    font-family: 'JetBrains Mono', monospace;
    font-size: 1.5rem;
    font-weight: 500;
    background: rgba(255,255,255,0.18);
    padding: 0.4rem 1rem;
    border-radius: 8px;
    direction: ltr;
  }

  .metrics-row {
    display: grid;
    grid-template-columns: 1fr;
    gap: 0;
    background: var(--paper);
  }
  @media (min-width: 560px) {
    .metrics-row { grid-template-columns: repeat(3, 1fr); }
  }

  /* شريط فئات التقدير */
  .grade-strip {
    display: flex;
    direction: rtl;
    border-bottom: 1px solid var(--line);
  }
  .gs-seg {
    flex: 1;
    text-align: center;
    padding: 0.7rem 0.3rem;
    font-size: 0.85rem;
    font-weight: 600;
    color: var(--ink-mute);
    background: var(--paper);
    border-left: 1px solid var(--line);
    transition: all 0.3s;
    position: relative;
  }
  .gs-seg:last-child { border-left: none; }
  .gs-seg.active {
    color: #fff;
    background: var(--teal);
  }
  .gs-seg.active::after {
    content: '▲';
    position: absolute;
    bottom: -1px;
    left: 50%;
    transform: translateX(-50%) translateY(100%);
    color: var(--teal);
    font-size: 0.6rem;
  }
  .metric {
    padding: 1.25rem 1.5rem;
    border-left: 1px solid var(--line);
    border-bottom: 1px solid var(--line);
    text-align: center;
  }
  .metric:last-child { border-left: none; }
  .metric .mlabel {
    font-size: 0.8rem;
    color: var(--ink-mute);
    margin-bottom: 0.3rem;
  }
  .metric .mval {
    font-family: 'JetBrains Mono', monospace;
    font-size: 1.7rem;
    font-weight: 500;
    color: var(--teal-deep);
    direction: ltr;
  }
  .metric .mnote { font-size: 0.78rem; color: var(--ink-soft); margin-top: 0.2rem; }

  .analysis-text {
    padding: 1.75rem 2rem;
  }
  .analysis-text h4 {
    font-size: 1.05rem;
    font-weight: 700;
    color: var(--ink);
    margin-bottom: 0.6rem;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }
  .analysis-text h4::before {
    content: '';
    width: 6px; height: 18px;
    background: var(--teal);
    border-radius: 3px;
  }
  .analysis-text p {
    color: var(--ink-soft);
    font-size: 0.96rem;
    margin-bottom: 0.75rem;
  }
  .analysis-text .recommend {
    background: var(--green-soft);
    border-radius: 6px;
    padding: 1rem 1.25rem;
    font-size: 0.95rem;
    color: var(--good);
    border-right: 3px solid var(--green);
  }
  .analysis-text .recommend strong { color: #1c5a4f; }

  .placeholder-msg {
    padding: 2.5rem 2rem;
    text-align: center;
    color: var(--ink-mute);
    font-size: 0.95rem;
  }

  /* ============ مرجع سريع: نطاقات ============ */
  .ref-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 0.75rem;
    margin-top: 1rem;
  }
  .ref-chip {
    background: var(--paper-card);
    border: 1px solid var(--line);
    border-radius: 8px;
    padding: 1rem;
    text-align: center;
  }
  .ref-chip .rc-band {
    font-family: 'JetBrains Mono', monospace;
    font-size: 0.85rem;
    color: #fff;
    padding: 0.2rem 0.6rem;
    border-radius: 5px;
    display: inline-block;
    margin-bottom: 0.5rem;
    direction: ltr;
  }
  .ref-chip .rc-title { font-size: 0.9rem; font-weight: 600; color: var(--ink); }
  .ref-chip .rc-desc { font-size: 0.78rem; color: var(--ink-soft); margin-top: 0.2rem; line-height: 1.5; }

  /* ============ المختبرات التفاعلية ============ */
  .lab {
    background: var(--paper-card);
    border: 1px solid var(--line);
    border-radius: 10px;
    padding: 2rem;
    position: relative;
  }
  .lab-tag {
    position: absolute;
    top: -11px;
    right: 1.5rem;
    background: var(--teal);
    color: #fff;
    font-size: 0.72rem;
    font-weight: 600;
    padding: 4px 12px;
    border-radius: 5px;
  }
  .lab-desc { color: var(--ink-soft); font-size: 0.95rem; margin-bottom: 1.5rem; }

  .lab-grid { display: grid; grid-template-columns: 1fr; gap: 1.5rem; }
  @media (min-width: 760px) {
    .lab-grid.split { grid-template-columns: 1.4fr 1fr; }
  }

  .canvas-wrap {
    background: var(--paper);
    border: 1px solid var(--line);
    border-radius: 8px;
    padding: 1rem;
    direction: ltr;
  }
  .canvas-wrap canvas { display: block; width: 100%; height: auto; }

  .controls { display: flex; flex-direction: column; gap: 1.5rem; justify-content: center; }
  .control-head { display: flex; justify-content: space-between; align-items: baseline; margin-bottom: 0.5rem; }
  .control-head label { font-size: 0.92rem; font-weight: 600; color: var(--ink); }
  .control-head .value {
    font-family: 'JetBrains Mono', monospace;
    font-size: 1.1rem;
    font-weight: 500;
    color: var(--teal-deep);
    direction: ltr;
  }
  input[type="range"] {
    -webkit-appearance: none; appearance: none;
    width: 100%; height: 5px;
    background: var(--line);
    border-radius: 3px; outline: none;
    direction: ltr;
  }
  input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none; appearance: none;
    width: 22px; height: 22px;
    background: var(--teal);
    border-radius: 50%; cursor: pointer;
    border: 3px solid #fff;
    box-shadow: 0 2px 6px rgba(14,107,102,0.3);
  }
  input[type="range"]::-moz-range-thumb {
    width: 22px; height: 22px;
    background: var(--teal);
    border-radius: 50%; cursor: pointer;
    border: 3px solid #fff;
  }
  .readout {
    background: var(--teal-header);
    color: #fff;
    border-radius: 8px;
    padding: 1rem 1.25rem;
    font-size: 0.9rem;
    line-height: 2;
  }
  .readout .row { display: flex; justify-content: space-between; align-items: center; }
  .readout .row .v { color: var(--green); font-family: 'JetBrains Mono', monospace; font-size: 0.9rem; }

  /* ============ أقسام الشرح ============ */
  /* المعايير الثلاثة */
  .criteria-flow {
    display: grid;
    grid-template-columns: 1fr;
    gap: 0.75rem;
    align-items: stretch;
  }
  @media (min-width: 760px) {
    .criteria-flow { grid-template-columns: 1fr auto 1fr auto 1fr; align-items: center; }
  }
  .crit-card {
    background: var(--paper-card);
    border: 1px solid var(--line);
    border-top: 3px solid var(--teal);
    border-radius: 10px;
    padding: 1.5rem 1.25rem;
    text-align: center;
    height: 100%;
  }
  .crit-icon {
    width: 48px; height: 48px; margin: 0 auto 0.7rem;
    background: var(--teal); color: #fff; border-radius: 12px;
    display: flex; align-items: center; justify-content: center;
    font-family: 'JetBrains Mono', monospace; font-size: 1.25rem; font-weight: 500;
  }
  .crit-name { font-weight: 700; color: var(--ink); font-size: 1.1rem; margin-bottom: 0.3rem; }
  .crit-q {
    font-size: 0.92rem; font-weight: 600; color: var(--teal-deep);
    margin-bottom: 0.6rem; padding-bottom: 0.5rem; border-bottom: 1px dashed var(--line);
  }
  .crit-desc { font-size: 0.9rem; color: var(--ink-soft); line-height: 1.75; }
  .crit-link {
    display: flex; align-items: center; justify-content: center;
    color: var(--teal-deep); font-weight: 600; font-size: 0.85rem;
    padding: 0.4rem 0.6rem; white-space: nowrap;
  }
  .crit-link::before { content: '↙'; margin-left: 0.3rem; font-size: 1.1rem; }
  @media (min-width: 760px) {
    .crit-link { flex-direction: column; }
    .crit-link::before { content: '←'; margin: 0 0 0.2rem 0; }
  }
  .cv-note {
    background: #eef6f5;
    border: 1px solid var(--line);
    border-radius: 8px;
    padding: 1rem 1.25rem;
    font-size: 0.92rem;
    color: var(--ink-soft);
    line-height: 1.8;
    margin-bottom: 1rem;
  }
  .cv-note strong { color: var(--teal-deep); }
  .cv-note .cv-val { font-family: 'JetBrains Mono', monospace; color: var(--teal-deep); font-weight: 600; direction: ltr; display: inline-block; }

  .shapes-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 1rem;
  }
  .shape-card {
    background: var(--paper-card);
    border: 1px solid var(--line);
    border-radius: 10px;
    padding: 1.25rem;
    transition: transform 0.25s, box-shadow 0.25s;
  }
  .shape-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 24px -10px rgba(14,107,102,0.18);
  }
  .shape-svg {
    background: var(--paper);
    border: 1px solid var(--line);
    border-radius: 8px;
    padding: 0.5rem;
    margin-bottom: 0.9rem;
    direction: ltr;
  }
  .shape-svg svg { display: block; width: 100%; height: auto; }
  .shape-name {
    font-weight: 700;
    color: var(--ink);
    font-size: 1.02rem;
    margin-bottom: 0.5rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid var(--line);
  }
  .shape-mean { font-size: 0.9rem; color: var(--ink-soft); line-height: 1.7; margin-bottom: 0.5rem; }
  .shape-act { font-size: 0.88rem; color: var(--good); line-height: 1.7; }

  .explain-bands {
    border: 1px solid var(--line);
    border-radius: 10px;
    overflow: hidden;
    background: var(--paper-card);
  }
  .eb-row { display: grid; grid-template-columns: 110px 1fr; border-bottom: 1px solid var(--line); }
  .eb-row:last-child { border-bottom: none; }
  .eb-range {
    display: flex; align-items: center; justify-content: center;
    color: #fff; font-family: 'JetBrains Mono', monospace; font-size: 0.85rem;
    font-weight: 500; padding: 1rem 0.5rem; text-align: center; direction: ltr;
  }
  .eb-body { padding: 1.1rem 1.4rem; }
  .eb-title { font-weight: 700; color: var(--ink); margin-bottom: 0.2rem; }
  .eb-desc { font-size: 0.92rem; color: var(--ink-soft); line-height: 1.7; }

  .ctype-table, .shapes-table {
    width: 100%; border-collapse: collapse;
    background: var(--paper-card); border: 1px solid var(--line);
    border-radius: 10px; overflow: hidden;
  }
  .ctype-table th, .shapes-table th {
    background: var(--teal-header); color: #fff;
    padding: 0.85rem 1rem; text-align: right; font-weight: 600; font-size: 0.92rem;
  }
  .ctype-table td, .shapes-table td {
    padding: 0.9rem 1rem; border-bottom: 1px solid var(--line);
    color: var(--ink-soft); vertical-align: top; line-height: 1.7; font-size: 0.94rem;
  }
  .ctype-table tr:last-child td, .shapes-table tr:last-child td { border-bottom: none; }
  .ctype-table td strong, .shapes-table td strong { color: var(--ink); }
  .ct-name { font-weight: 700; color: var(--teal-deep); }
  .ct-num { font-family: 'JetBrains Mono', monospace; color: var(--ink); direction: ltr; }
  .sh-hint { font-size: 0.8rem; color: var(--ink-mute); }

  .combine-flow {
    display: grid; grid-template-columns: 1fr; gap: 0;
    background: var(--paper-card); border: 1px solid var(--line);
    border-radius: 10px; overflow: hidden; margin-bottom: 1.5rem;
  }
  @media (min-width: 720px) {
    .combine-flow { grid-template-columns: 1fr 48px 1fr 48px 1fr; }
  }
  .cf-card { padding: 1.5rem; text-align: center; }
  .cf-icon {
    width: 46px; height: 46px; margin: 0 auto 0.6rem;
    background: var(--teal); color: #fff; border-radius: 12px;
    display: flex; align-items: center; justify-content: center;
    font-family: 'JetBrains Mono', monospace; font-size: 1.2rem; font-weight: 500;
  }
  .cf-title { font-weight: 700; color: var(--ink); margin-bottom: 0.3rem; }
  .cf-desc { font-size: 0.9rem; color: var(--ink-soft); line-height: 1.7; }
  .cf-arrow {
    display: flex; align-items: center; justify-content: center;
    background: var(--paper); color: var(--teal); font-size: 1.5rem;
    border-right: 1px solid var(--line); border-left: 1px solid var(--line);
  }
  @media (max-width: 719px) {
    .cf-arrow { min-height: 40px; border: none; border-top: 1px solid var(--line); border-bottom: 1px solid var(--line); }
  }
  .combine-steps {
    background: var(--green-soft); border-radius: 10px; padding: 1.5rem 1.75rem;
    border-right: 3px solid var(--green);
  }
  .combine-steps h4 { font-size: 1.05rem; font-weight: 700; color: #1c5a4f; margin-bottom: 0.75rem; }
  .combine-steps ol { padding-right: 1.2rem; color: var(--ink-soft); }
  .combine-steps li { margin-bottom: 0.5rem; line-height: 1.75; font-size: 0.95rem; }

  /* ============ تذييل ============ */
  .footer {
    margin-top: 3.5rem;
    padding-top: 2rem;
    border-top: 1px solid var(--line);
    text-align: center;
    color: var(--ink-mute);
    font-size: 0.82rem;
    line-height: 1.9;
  }
  .footer .org-line { font-weight: 600; color: var(--ink-soft); }
  .footer .designer-line span { color: var(--teal-deep); font-weight: 600; }
</style>
</head>
<body>

  <!-- ============ الرأس المؤسسي ============ -->
  <header class="masthead">
    <div class="masthead-inner">
      <div class="masthead-text">
        <h1>أداة تحليل نتائج المقررات</h1>
        <div class="college">الكلية التقنية بميسان</div>
        <div class="org">المؤسسة العامة للتدريب التقني والمهني</div>
      </div>
      <div class="masthead-logo">
        <img src="data:image/png;base64,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" alt="شعار المؤسسة العامة للتدريب التقني والمهني" />
      </div>
    </div>
    <div class="subbar">
      <div class="subbar-inner">
        <div class="designer">تصميم الأداة: <span>ريان سعيد الثبيتي</span></div>
        <div>أداة مساندة لتحليل نتائج المقررات</div>
      </div>
    </div>
  </header>

  <div class="container">

    <!-- مقدمة -->
    <div class="intro">
      <p>تساعد هذه الأداة المدرب على قراءة نتائج اختبارات مقرره قراءة تكشف ما وراء الأرقام. فنتيجة الفصل لا تفهم من رقم واحد، بل من ثلاثة معايير متتابعة يبني كل منها على الذي قبله.</p>
    </div>

    <!-- المعايير الثلاثة -->
    <section class="section">
      <div class="section-head">
        <div class="idx">١</div>
        <h2>المعايير الثلاثة لقراءة نتيجة الاختبار</h2>
      </div>
      <p class="section-intro">قبل استعمال الأداة، هذه نظرة سريعة على المعايير الثلاثة بترتيبها المنطقي. كل معيار يجيب عن سؤال يكمل ما قبله.</p>

      <div class="criteria-flow">
        <div class="crit-card">
          <div class="crit-icon">μ</div>
          <div class="crit-name">المتوسط</div>
          <div class="crit-q">كيف أدى الفصل؟</div>
          <div class="crit-desc">معدل درجات الفصل. يخبرك أين يقع أداء الفصل عموما، لكنه وحده لا يكفي، إذ قد يتساوى فصلان في المتوسط ويختلفان اختلافا كبيرا في حال متدربيهما.</div>
        </div>
        <div class="crit-link">يكمله</div>
        <div class="crit-card">
          <div class="crit-icon">σ</div>
          <div class="crit-name">الانحراف المعياري</div>
          <div class="crit-q">بأي قدر من التقارب؟</div>
          <div class="crit-desc">مقدار تباعد الدرجات عن المتوسط. فإذا تقاربت درجات الفصل كان الانحراف صغيرا، وإذا تباعدت كان كبيرا. هو الذي يفرق بين فصل متجانس وفصل متباين رغم تساوي متوسطيهما.</div>
        </div>
        <div class="crit-link">يكشفه</div>
        <div class="crit-card">
          <div class="crit-icon">▮▮</div>
          <div class="crit-name">شكل التوزيع</div>
          <div class="crit-q">ما الذي يجري داخل الفصل؟</div>
          <div class="crit-desc">الصورة الكاملة لتوزع الدرجات على الفئات. يكشف ما يعجز الرقمان السابقان عن إظهاره، كأن ينقسم الفصل إلى مجموعتين، أو يميل إلى طرف دون آخر.</div>
        </div>
      </div>
    </section>

    <!-- ============ القسم الأول: المحلل ============ -->
    <section class="section">
      <div class="section-head">
        <div class="idx">٢</div>
        <h2>تحليل نتيجة الاختبار</h2>
      </div>
      <p class="section-intro">اختر الاختبار، وأدخل متوسط درجات الفصل وانحرافه المعياري كما يظهران لديك، لتعرض الأداة حالة الفصل وموقع متوسطه من فئات التقدير وتوصية عملية مباشرة.</p>

      <div class="analyzer">
        <div class="analyzer-inputs four">
          <div class="ainput">
            <label for="inTest">الاختبار</label>
            <div class="hint">يضبط الدرجة العظمى والحدود</div>
            <select id="inTest">
              <option value="mid_t">نصفي — نظري (من 20)</option>
              <option value="mid_tp">نصفي — نظري/عملي (من 13)</option>
              <option value="fin_theory_t">نهائي نظري — نظري (من 40)</option>
              <option value="fin_theory_tp">نهائي نظري — نظري/عملي (من 27)</option>
              <option value="fin_prac_tp">نهائي عملي — نظري/عملي (من 13)</option>
              <option value="fin_prac_p">نهائي عملي — عملي (من 40)</option>
              <option value="total">المجموع النهائي (من 100)</option>
            </select>
          </div>
          <div class="ainput">
            <label for="inMean">المتوسط</label>
            <div class="hint" id="meanHint">متوسط درجات الفصل من 20</div>
            <input type="number" id="inMean" min="0" step="0.1" placeholder="مثال: 14" />
          </div>
          <div class="ainput">
            <label for="inSd">الانحراف المعياري</label>
            <div class="hint">قيمة الانحراف كما تظهر لديك</div>
            <input type="number" id="inSd" min="0" step="0.1" placeholder="مثال: 2.5" />
          </div>
          <div class="ainput">
            <label for="inCount">عدد المتدربين</label>
            <div class="hint">اختياري، لدقة العرض</div>
            <input type="number" id="inCount" min="1" step="1" placeholder="اختياري" />
          </div>
        </div>

        <div class="analyzer-result" id="result">
          <div class="verdict-bar" id="verdictBar">
            <div>
              <div class="vtext" id="verdictText">—</div>
              <div class="vsub" id="verdictSub">—</div>
            </div>
            <div class="vbadge" id="verdictBadge">—</div>
          </div>

          <div class="grade-strip" id="gradeStrip">
            <div class="gs-seg" data-tier="راسب">راسب</div>
            <div class="gs-seg" data-tier="مقبول">مقبول</div>
            <div class="gs-seg" data-tier="جيد">جيد</div>
            <div class="gs-seg" data-tier="جيد جدا">جيد جدا</div>
            <div class="gs-seg" data-tier="ممتاز">ممتاز</div>
          </div>

          <div class="metrics-row">
            <div class="metric">
              <div class="mlabel">معامل الاختلاف</div>
              <div class="mval" id="mCv">—</div>
              <div class="mnote">الانحراف نسبة إلى المتوسط</div>
            </div>
            <div class="metric">
              <div class="mlabel">النطاق المتوقع (±1 انحراف)</div>
              <div class="mval" id="mRange">—</div>
              <div class="mnote">يقع فيه نحو ثلثي الفصل</div>
            </div>
            <div class="metric">
              <div class="mlabel">حالة الانحراف</div>
              <div class="mval" id="mSdState" style="font-size:1.15rem;">—</div>
              <div class="mnote">مقارنة بنوع المقرر</div>
            </div>
          </div>

          <div class="analysis-text">
            <h4>قراءة النتيجة</h4>
            <p id="analysisBody">—</p>
            <div class="cv-note" id="cvNote">—</div>
            <div class="recommend" id="recommendBox">—</div>
          </div>
        </div>

        <div class="placeholder-msg" id="placeholder">
          أدخل المتوسط والانحراف المعياري لعرض التحليل.
        </div>
      </div>
    </section>

    <!-- ============ القسم 3: كيف تستعملها مجتمعة ============ -->
    <section class="section">
      <div class="section-head">
        <div class="idx">٣</div>
        <h2>كيف تقرأ المعايير الثلاثة مجتمعة</h2>
      </div>
      <p class="section-intro">بعد ظهور النتيجة، اقرأ المعايير الثلاثة بترتيبها. كل معيار يقودك إلى الذي بعده، فالمتوسط يدلك أين وقع الفصل، والانحراف يدلك هل تقاربت درجاته أم تباعدت، والتوزيع يكشف لك السبب.</p>

      <div class="combine-flow">
        <div class="cf-card">
          <div class="cf-icon">μ</div>
          <div class="cf-title">ابدأ بالمتوسط</div>
          <div class="cf-desc">انظر أين وقع متوسط الفصل، وفي أي فئة تقدير. هذا يعطيك الصورة العامة لأداء الفصل.</div>
        </div>
        <div class="cf-arrow">←</div>
        <div class="cf-card">
          <div class="cf-icon">σ</div>
          <div class="cf-title">ثم الانحراف المعياري</div>
          <div class="cf-desc">اقرأ مقدار تباعد الدرجات عن المتوسط. هل الفصل متقارب أم متباعد؟ هنا يظهر معامل الاختلاف ليضع التباعد في سياق المتوسط.</div>
        </div>
        <div class="cf-arrow">←</div>
        <div class="cf-card">
          <div class="cf-icon">▮▮</div>
          <div class="cf-title">ثم شكل التوزيع</div>
          <div class="cf-desc">إن لفت الانحراف نظرك بقيمة غير معتادة، ارجع إلى شكل توزيع الدرجات لتعرف السبب الحقيقي وراء الرقم.</div>
        </div>
      </div>

      <div class="combine-steps">
        <h4>تسلسل عملي لمراجعة نتيجة اختبار</h4>
        <ol>
          <li>اختر الاختبار وأدخل المتوسط والانحراف، وانظر في أي فئة تقدير وقع المتوسط.</li>
          <li>اقرأ حالة الانحراف ومعامل الاختلاف معا، لتعرف هل درجات الفصل متقاربة أم متباعدة.</li>
          <li>إن كان الانحراف مرتفعا أو صغيرا بصورة لافتة، ارجع إلى توزيع الدرجات الفعلي على الفئات لتعرف الشكل.</li>
          <li>وازن القراءة مع نوع الاختبار. تباعد الدرجات في اختبار عملي أكثر إثارة للقلق منه في اختبار نظري.</li>
          <li>قارن النتيجة بالفصل السابق لنفس الاختبار. فصل واحد نقطة بيانات، والاتجاه عبر الفصول رؤية.</li>
        </ol>
      </div>
    </section>

    <!-- ============ القسم 4: أشكال التوزيع ============ -->
    <section class="section">
      <div class="section-head">
        <div class="idx">٤</div>
        <h2>أشكال توزيع الدرجات ومدلولاتها</h2>
      </div>
      <p class="section-intro">هذه أهم خطوة يراجعها المدرب عند ظهور النتيجة. فالانحراف يلخص مقدار تباعد الدرجات، لكنه لا يكشف شكلها. وقد يتساوى فصلان في المتوسط والانحراف ويختلف شكلاهما تماما. تأمل الشكل الذي يشبه فصلك واقرأ دلالته.</p>

      <div class="shapes-grid">
        <div class="shape-card">
          <div class="shape-svg"><svg viewBox="0 0 240 120" xmlns="http://www.w3.org/2000/svg"><line x1="8" y1="102" x2="232" y2="102" stroke="#dce6e6" stroke-width="1"/><rect x="9.5" y="94.3" width="17.4" height="7.7" rx="1.5" fill="#22B9B0"/><rect x="29.9" y="86.7" width="17.4" height="15.3" rx="1.5" fill="#22B9B0"/><rect x="50.2" y="71.3" width="17.4" height="30.7" rx="1.5" fill="#22B9B0"/><rect x="70.6" y="48.3" width="17.4" height="53.7" rx="1.5" fill="#22B9B0"/><rect x="91.0" y="25.3" width="17.4" height="76.7" rx="1.5" fill="#22B9B0"/><rect x="111.3" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#22B9B0"/><rect x="131.7" y="25.3" width="17.4" height="76.7" rx="1.5" fill="#22B9B0"/><rect x="152.0" y="48.3" width="17.4" height="53.7" rx="1.5" fill="#22B9B0"/><rect x="172.4" y="71.3" width="17.4" height="30.7" rx="1.5" fill="#22B9B0"/><rect x="192.8" y="86.7" width="17.4" height="15.3" rx="1.5" fill="#22B9B0"/><rect x="213.1" y="94.3" width="17.4" height="7.7" rx="1.5" fill="#22B9B0"/></svg></div>
          <div class="shape-name">جرسي متماثل</div>
          <div class="shape-mean">الدلالة: سليم. فصل متباين القدرات واختبار مضبوط.</div>
          <div class="shape-act">الإجراء: حافظ عليه واتخذه خط أساس تقارن عليه.</div>
        </div>
        <div class="shape-card">
          <div class="shape-svg"><svg viewBox="0 0 240 120" xmlns="http://www.w3.org/2000/svg"><line x1="8" y1="102" x2="232" y2="102" stroke="#dce6e6" stroke-width="1"/><rect x="9.5" y="94.9" width="17.4" height="7.1" rx="1.5" fill="#168f88"/><rect x="29.9" y="94.9" width="17.4" height="7.1" rx="1.5" fill="#168f88"/><rect x="50.2" y="87.8" width="17.4" height="14.2" rx="1.5" fill="#168f88"/><rect x="70.6" y="87.8" width="17.4" height="14.2" rx="1.5" fill="#168f88"/><rect x="91.0" y="80.8" width="17.4" height="21.2" rx="1.5" fill="#168f88"/><rect x="111.3" y="66.6" width="17.4" height="35.4" rx="1.5" fill="#168f88"/><rect x="131.7" y="45.4" width="17.4" height="56.6" rx="1.5" fill="#168f88"/><rect x="152.0" y="24.2" width="17.4" height="77.8" rx="1.5" fill="#168f88"/><rect x="172.4" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#168f88"/><rect x="192.8" y="17.1" width="17.4" height="84.9" rx="1.5" fill="#168f88"/><rect x="213.1" y="52.5" width="17.4" height="49.5" rx="1.5" fill="#168f88"/></svg></div>
          <div class="shape-name">ملتو إلى المنخفض</div>
          <div class="shape-mean">الدلالة: معظمهم أبلوا حسنا، وقليل تعثروا. قد تكون فجوات فردية أو غياب.</div>
          <div class="shape-act">الإجراء: افحص المتعثرين فردا فردا وضع خطط تحسين.</div>
        </div>
        <div class="shape-card">
          <div class="shape-svg"><svg viewBox="0 0 240 120" xmlns="http://www.w3.org/2000/svg"><line x1="8" y1="102" x2="232" y2="102" stroke="#dce6e6" stroke-width="1"/><rect x="9.5" y="52.5" width="17.4" height="49.5" rx="1.5" fill="#168f88"/><rect x="29.9" y="17.1" width="17.4" height="84.9" rx="1.5" fill="#168f88"/><rect x="50.2" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#168f88"/><rect x="70.6" y="24.2" width="17.4" height="77.8" rx="1.5" fill="#168f88"/><rect x="91.0" y="45.4" width="17.4" height="56.6" rx="1.5" fill="#168f88"/><rect x="111.3" y="66.6" width="17.4" height="35.4" rx="1.5" fill="#168f88"/><rect x="131.7" y="80.8" width="17.4" height="21.2" rx="1.5" fill="#168f88"/><rect x="152.0" y="87.8" width="17.4" height="14.2" rx="1.5" fill="#168f88"/><rect x="172.4" y="87.8" width="17.4" height="14.2" rx="1.5" fill="#168f88"/><rect x="192.8" y="94.9" width="17.4" height="7.1" rx="1.5" fill="#168f88"/><rect x="213.1" y="94.9" width="17.4" height="7.1" rx="1.5" fill="#168f88"/></svg></div>
          <div class="shape-name">ملتو إلى المرتفع</div>
          <div class="shape-mean">الدلالة: الاختبار صعب على الأغلبية، وقليل أتقنه. قد تكون أسئلة صعبة أو محتوى لم يغط.</div>
          <div class="shape-act">الإجراء: راجع صعوبة الأسئلة وأعد تدريس الفجوات.</div>
        </div>
        <div class="shape-card">
          <div class="shape-svg"><svg viewBox="0 0 240 120" xmlns="http://www.w3.org/2000/svg"><line x1="8" y1="102" x2="232" y2="102" stroke="#dce6e6" stroke-width="1"/><rect x="9.5" y="85.3" width="17.4" height="16.7" rx="1.5" fill="#b8503f"/><rect x="29.9" y="51.8" width="17.4" height="50.2" rx="1.5" fill="#b8503f"/><rect x="50.2" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#b8503f"/><rect x="70.6" y="43.5" width="17.4" height="58.5" rx="1.5" fill="#b8503f"/><rect x="91.0" y="76.9" width="17.4" height="25.1" rx="1.5" fill="#b8503f"/><rect x="111.3" y="85.3" width="17.4" height="16.7" rx="1.5" fill="#b8503f"/><rect x="131.7" y="76.9" width="17.4" height="25.1" rx="1.5" fill="#b8503f"/><rect x="152.0" y="43.5" width="17.4" height="58.5" rx="1.5" fill="#b8503f"/><rect x="172.4" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#b8503f"/><rect x="192.8" y="51.8" width="17.4" height="50.2" rx="1.5" fill="#b8503f"/><rect x="213.1" y="85.3" width="17.4" height="16.7" rx="1.5" fill="#b8503f"/></svg></div>
          <div class="shape-name">ثنائي القمة</div>
          <div class="shape-mean">الدلالة: مجموعتان داخل الفصل. غالبا فجوة معرفة سابقة أو انقسام في الحضور.</div>
          <div class="shape-act">الإجراء: نوع التدريس وحدد العامل الفاصل بين المجموعتين.</div>
        </div>
        <div class="shape-card">
          <div class="shape-svg"><svg viewBox="0 0 240 120" xmlns="http://www.w3.org/2000/svg"><line x1="8" y1="102" x2="232" y2="102" stroke="#dce6e6" stroke-width="1"/><rect x="9.5" y="23.1" width="17.4" height="78.9" rx="1.5" fill="#c8902f"/><rect x="29.9" y="23.1" width="17.4" height="78.9" rx="1.5" fill="#c8902f"/><rect x="50.2" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#c8902f"/><rect x="70.6" y="23.1" width="17.4" height="78.9" rx="1.5" fill="#c8902f"/><rect x="91.0" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#c8902f"/><rect x="111.3" y="23.1" width="17.4" height="78.9" rx="1.5" fill="#c8902f"/><rect x="131.7" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#c8902f"/><rect x="152.0" y="23.1" width="17.4" height="78.9" rx="1.5" fill="#c8902f"/><rect x="172.4" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#c8902f"/><rect x="192.8" y="23.1" width="17.4" height="78.9" rx="1.5" fill="#c8902f"/><rect x="213.1" y="23.1" width="17.4" height="78.9" rx="1.5" fill="#c8902f"/></svg></div>
          <div class="shape-name">منتظم مسطح</div>
          <div class="shape-mean">الدلالة: الاختبار لا يميز. الأسئلة قد تحل بالتخمين أو لا تتصل بالتدريس.</div>
          <div class="shape-act">الإجراء: حلل الأسئلة بمعاملي الصعوبة والتمييز.</div>
        </div>
        <div class="shape-card">
          <div class="shape-svg"><svg viewBox="0 0 240 120" xmlns="http://www.w3.org/2000/svg"><line x1="8" y1="102" x2="232" y2="102" stroke="#dce6e6" stroke-width="1"/><rect x="9.5" y="95.9" width="17.4" height="6.1" rx="1.5" fill="#528CA0"/><rect x="29.9" y="95.9" width="17.4" height="6.1" rx="1.5" fill="#528CA0"/><rect x="50.2" y="95.9" width="17.4" height="6.1" rx="1.5" fill="#528CA0"/><rect x="70.6" y="89.7" width="17.4" height="12.3" rx="1.5" fill="#528CA0"/><rect x="91.0" y="89.7" width="17.4" height="12.3" rx="1.5" fill="#528CA0"/><rect x="111.3" y="83.6" width="17.4" height="18.4" rx="1.5" fill="#528CA0"/><rect x="131.7" y="77.5" width="17.4" height="24.5" rx="1.5" fill="#528CA0"/><rect x="152.0" y="65.2" width="17.4" height="36.8" rx="1.5" fill="#528CA0"/><rect x="172.4" y="46.8" width="17.4" height="55.2" rx="1.5" fill="#528CA0"/><rect x="192.8" y="22.3" width="17.4" height="79.7" rx="1.5" fill="#528CA0"/><rect x="213.1" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#528CA0"/></svg></div>
          <div class="shape-name">تجمع عند القمة (أثر السقف)</div>
          <div class="shape-mean">الدلالة: الاختبار سهل جدا، والأغلبية عند أو قرب الدرجة العليا.</div>
          <div class="shape-act">الإجراء: أضف أسئلة أصعب، أو اقبله في اختبارات الإتقان.</div>
        </div>
        <div class="shape-card">
          <div class="shape-svg"><svg viewBox="0 0 240 120" xmlns="http://www.w3.org/2000/svg"><line x1="8" y1="102" x2="232" y2="102" stroke="#dce6e6" stroke-width="1"/><rect x="9.5" y="10.0" width="17.4" height="92.0" rx="1.5" fill="#528CA0"/><rect x="29.9" y="22.3" width="17.4" height="79.7" rx="1.5" fill="#528CA0"/><rect x="50.2" y="46.8" width="17.4" height="55.2" rx="1.5" fill="#528CA0"/><rect x="70.6" y="65.2" width="17.4" height="36.8" rx="1.5" fill="#528CA0"/><rect x="91.0" y="77.5" width="17.4" height="24.5" rx="1.5" fill="#528CA0"/><rect x="111.3" y="83.6" width="17.4" height="18.4" rx="1.5" fill="#528CA0"/><rect x="131.7" y="89.7" width="17.4" height="12.3" rx="1.5" fill="#528CA0"/><rect x="152.0" y="89.7" width="17.4" height="12.3" rx="1.5" fill="#528CA0"/><rect x="172.4" y="95.9" width="17.4" height="6.1" rx="1.5" fill="#528CA0"/><rect x="192.8" y="95.9" width="17.4" height="6.1" rx="1.5" fill="#528CA0"/><rect x="213.1" y="95.9" width="17.4" height="6.1" rx="1.5" fill="#528CA0"/></svg></div>
          <div class="shape-name">تجمع عند القاع (أثر الأرضية)</div>
          <div class="shape-mean">الدلالة: الاختبار صعب جدا، أو فجوة تدريس، أو محتوى مختلف عما اختبر.</div>
          <div class="shape-act">الإجراء: مراجعة عاجلة للتدريس وجودة الأسئلة.</div>
        </div>
      </div>
    </section>

    <!-- ============ القسم 5: نطاقات التفسير ============ -->
    <section class="section">
      <div class="section-head">
        <div class="idx">٥</div>
        <h2>نطاقات تفسير الانحراف المعياري</h2>
      </div>
      <p class="section-intro">القيم أدناه مرجعها مقياس 100. والأداة تحول انحراف اختبارك تلقائيا إلى ما يعادله على هذا المقياس قبل التشخيص، فتبقى النطاقات ذات معنى مهما اختلفت الدرجة العظمى.</p>

      <div class="explain-bands">
        <div class="eb-row">
          <div class="eb-range" style="background:var(--slate);">أقل من 7</div>
          <div class="eb-body">
            <div class="eb-title">صغير جدا — الاختبار لا يميز</div>
            <div class="eb-desc">درجات الفصل متقاربة جدا. يعني ذلك عادة اختبارا سهلا (أثر سقف) أو تساهلا في التصحيح. الاختبار لا يفصل بين المتدربين، فلا يخبرك من تعلم ماذا. افحص قبل أن تطمئن.</div>
          </div>
        </div>
        <div class="eb-row">
          <div class="eb-range" style="background:#6b8a51;">7 – 10</div>
          <div class="eb-body">
            <div class="eb-title">صغير لكن مقبول</div>
            <div class="eb-desc">طبيعي للاختبارات العملية أو القائمة على الإتقان، حيث الهدف وصول الجميع إلى عتبة محددة. اقرأه مع شكل التوزيع قبل الحكم.</div>
          </div>
        </div>
        <div class="eb-row">
          <div class="eb-range" style="background:var(--teal-deep);">10 – 15</div>
          <div class="eb-body">
            <div class="eb-title">النطاق المثالي</div>
            <div class="eb-desc">تباعد سليم لمعظم الاختبارات النظرية. الاختبار يميز، والمتوسط ذو معنى، والتوزيع يقترب عادة من المنحنى الجرسي.</div>
          </div>
        </div>
        <div class="eb-row">
          <div class="eb-range" style="background:var(--warn);">15 – 20</div>
          <div class="eb-body">
            <div class="eb-title">أوسع من المثالي — يستحق الفحص</div>
            <div class="eb-desc">ليس مقلقا، لكنه يستحق فتح توزيع الدرجات. قد يكون الفوج متباين القدرات، أو اختبارا صعبا بذيل طويل من الدرجات المنخفضة.</div>
          </div>
        </div>
        <div class="eb-row">
          <div class="eb-range" style="background:var(--bad);">أكثر من 20</div>
          <div class="eb-body">
            <div class="eb-title">كبير — منقسم أو يحتاج مراجعة</div>
            <div class="eb-desc">إما أن الفصل يحوي مجموعتين متمايزتين، أو أن الاختبار فيه أسئلة يخطئ فيها الأقوياء ويصيب فيها الضعفاء بالتخمين. افحص التوزيع دائما قبل الاستنتاج.</div>
          </div>
        </div>
      </div>
    </section>

    <!-- ============ القسم 6: التعديلات بحسب نوع المقرر ============ -->
    <section class="section">
      <div class="section-head">
        <div class="idx">٦</div>
        <h2>لماذا يختلف النطاق المتوقع بحسب نوع المقرر</h2>
      </div>
      <p class="section-intro">النطاق المثالي للانحراف ليس واحدا لكل الاختبارات. الأداة تضبطه تلقائيا بحسب نوع الاختبار الذي تختاره، للأسباب الموضحة أدناه.</p>

      <table class="ctype-table">
        <thead>
          <tr><th>نوع الاختبار</th><th>الانحراف المتوقع</th><th>السبب</th></tr>
        </thead>
        <tbody>
          <tr>
            <td class="ct-name">نظري</td>
            <td class="ct-num">10 – 15</td>
            <td>الفهم النظري يتفاوت بطبيعته بين المتدربين، فتباعد الدرجات الأوسع متوقع وسليم.</td>
          </tr>
          <tr>
            <td class="ct-name">عملي</td>
            <td class="ct-num">5 – 10</td>
            <td>المهارات العملية تتقن أو لا تتقن، والمتدرب يكرر التدريب حتى يجتاز. تباعد الدرجات المرتفع هنا إشارة إلى أن بعض المتدربين غادروا دون اكتساب الكفاءة.</td>
          </tr>
          <tr>
            <td class="ct-name">نظري/عملي</td>
            <td class="ct-num">8 – 13</td>
            <td>يقع بين القيمتين، لأن الشق العملي يقارب بين الدرجات بينما يباعدها الشق النظري.</td>
          </tr>
        </tbody>
      </table>
    </section>

    <!-- ============ المختبر التفاعلي ============ -->
    <section class="section">
      <div class="section-head">
        <div class="idx">٧</div>
        <h2>مختبر المنحنى الجرسي</h2>
      </div>
      <p class="section-intro">حرك المتوسط والانحراف وراقب أثرهما في شكل التوزيع وعرضه. كلما صغر الانحراف ضاق المنحنى وارتفع، وكلما كبر اتسع وانخفض.</p>

      <div class="lab">
        <div class="lab-tag">تفاعلي</div>
        <div class="lab-grid split">
          <div class="canvas-wrap">
            <canvas id="bellCanvas" width="600" height="320"></canvas>
          </div>
          <div class="controls">
            <div>
              <div class="control-head">
                <label for="bMean">المتوسط</label>
                <span class="value" id="bMeanV">75</span>
              </div>
              <input type="range" id="bMean" min="40" max="95" value="75" step="1" />
            </div>
            <div>
              <div class="control-head">
                <label for="bSd">الانحراف المعياري</label>
                <span class="value" id="bSdV">10</span>
              </div>
              <input type="range" id="bSd" min="2" max="25" value="10" step="1" />
            </div>
            <div class="readout">
              <div class="row"><span>نطاق ±1 انحراف</span><span class="v" id="bR1">65 – 85</span></div>
              <div class="row"><span>نطاق ±2 انحراف</span><span class="v" id="bR2">55 – 95</span></div>
              <div class="row"><span>معامل الاختلاف</span><span class="v" id="bCv">13.3%</span></div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <footer class="footer">
      <p class="org-line">الكلية التقنية بميسان — المؤسسة العامة للتدريب التقني والمهني</p>
      <p class="designer-line">تصميم الأداة: <span>ريان سعيد الثبيتي</span></p>
      <p>أداة مساندة لتحليل نتائج المقررات، تكمل أنظمة الكلية ولا تحل محلها.</p>
    </footer>

  </div>

<script>
/* ============ القسم 1: المحلل ============ */
(function() {
  const inTest = document.getElementById('inTest');
  const inMean = document.getElementById('inMean');
  const inSd = document.getElementById('inSd');
  const inCount = document.getElementById('inCount');
  const meanHint = document.getElementById('meanHint');
  const result = document.getElementById('result');
  const placeholder = document.getElementById('placeholder');

  const verdictBar = document.getElementById('verdictBar');
  const verdictText = document.getElementById('verdictText');
  const verdictSub = document.getElementById('verdictSub');
  const verdictBadge = document.getElementById('verdictBadge');
  const mCv = document.getElementById('mCv');
  const mRange = document.getElementById('mRange');
  const mSdState = document.getElementById('mSdState');
  const analysisBody = document.getElementById('analysisBody');
  const recommendBox = document.getElementById('recommendBox');
  const cvNote = document.getElementById('cvNote');
  const gradeStrip = document.getElementById('gradeStrip');

  const COLORS = { good:'#2d7d6f', warn:'#c8902f', bad:'#b8503f', tight:'#528CA0' };

  // بيانات الاختبارات: الدرجة العظمى، نوع المقرر، وحدود التقدير (مقبول/جيد/جيد جدا/ممتاز)
  // kind يحدد النطاق المتوقع للانحراف: نظري أوسع، عملي أضيق
  const TESTS = {
    mid_t:        { max:20,  kind:'theory',    label:'نصفي نظري',            tiers:{ مقبول:12, جيد:14, 'جيد جدا':16, ممتاز:18 } },
    mid_tp:       { max:13,  kind:'mixed',     label:'نصفي نظري/عملي',       tiers:{ مقبول:7,  جيد:9,  'جيد جدا':11, ممتاز:12 } },
    fin_theory_t: { max:40,  kind:'theory',    label:'نهائي نظري',           tiers:{ مقبول:24, جيد:28, 'جيد جدا':32, ممتاز:36 } },
    fin_theory_tp:{ max:27,  kind:'mixed',     label:'نهائي نظري (نظري/عملي)',tiers:{ مقبول:17, جيد:19, 'جيد جدا':22, ممتاز:24 } },
    fin_prac_tp:  { max:13,  kind:'practical', label:'نهائي عملي (نظري/عملي)',tiers:{ مقبول:7,  جيد:9,  'جيد جدا':11, ممتاز:12 } },
    fin_prac_p:   { max:40,  kind:'practical', label:'نهائي عملي',           tiers:{ مقبول:24, جيد:28, 'جيد جدا':32, ممتاز:36 } },
    total:        { max:100, kind:'mixed',     label:'المجموع النهائي',      tiers:{ مقبول:60, جيد:70, 'جيد جدا':80, ممتاز:90 } }
  };

  // النطاقات المتوقعة للانحراف على مقياس 100، بحسب طبيعة الاختبار
  const SD_RANGES = {
    theory:    { lo:10, hi:15, label:'نظري' },
    practical: { lo:5,  hi:10, label:'عملي' },
    mixed:     { lo:8,  hi:13, label:'نظري/عملي' }
  };

  function tierOf(score, tiers) {
    if (score >= tiers['ممتاز']) return 'ممتاز';
    if (score >= tiers['جيد جدا']) return 'جيد جدا';
    if (score >= tiers['جيد']) return 'جيد';
    if (score >= tiers['مقبول']) return 'مقبول';
    return 'راسب';
  }

  function updateHint() {
    const t = TESTS[inTest.value];
    meanHint.textContent = 'متوسط درجات الفصل من ' + t.max;
    inMean.max = t.max;
    inMean.placeholder = 'مثال: ' + Math.round(t.max * 0.7);
  }

  function analyze() {
    const t = TESTS[inTest.value];
    const mean = parseFloat(inMean.value);
    const sd = parseFloat(inSd.value);

    if (isNaN(mean) || isNaN(sd) || mean <= 0) {
      result.classList.remove('show');
      placeholder.style.display = 'block';
      return;
    }
    // حماية: المتوسط لا يتجاوز الدرجة العظمى
    if (mean > t.max) {
      placeholder.style.display = 'block';
      placeholder.textContent = 'المتوسط (' + mean + ') أكبر من الدرجة العظمى للاختبار (' + t.max + '). تحقق من الإدخال.';
      result.classList.remove('show');
      return;
    }
    placeholder.style.display = 'none';
    result.classList.add('show');

    // تحويل إلى مقياس 100 لتطبيق نطاقات الانحراف
    const meanPct = (mean / t.max) * 100;
    const sdPct = (sd / t.max) * 100;
    const cv = (sd / mean) * 100;          // معامل الاختلاف لا يتأثر بالمقياس
    const r = SD_RANGES[t.kind];

    const lo = Math.max(0, mean - sd);
    const hi = Math.min(t.max, mean + sd);

    mCv.textContent = cv.toFixed(1) + '%';
    mRange.textContent = lo.toFixed(1) + ' – ' + hi.toFixed(1);

    // فئة التقدير التي يقع فيها المتوسط
    const tier = tierOf(mean, t.tiers);
    [...gradeStrip.querySelectorAll('.gs-seg')].forEach(seg => {
      seg.classList.toggle('active', seg.dataset.tier === tier);
    });

    // تشخيص الانحراف باستعمال القيمة المحولة إلى 100
    let sdState, color, vText, vSub, body, rec;
    if (sdPct < r.lo - 2) {
      sdState='ضيق جدا'; color=COLORS.tight; vText='انحراف صغير';
      vSub='الدرجات متقاربة أكثر من المتوقع لاختبار ' + r.label;
      body='الانحراف المعياري أقل من النطاق المتوقع لهذا النوع من الاختبارات، مما يعني تقارب درجات المتدربين. قد يكون ذلك أثرا لاختبار لا يميز بين المستويات، أو لتساهل في التصحيح، أو لكون المهارة المقيسة يتقنها الجميع بدرجة متقاربة.';
      rec='راجع أسئلة الاختبار وتأكد من أنها تفصل بين المستويات. وإن كان الاختبار عمليا أو قائما على الإتقان، فالتقارب هنا مقبول.';
    } else if (sdPct <= r.hi) {
      sdState='ضمن المثالي'; color=COLORS.good; vText='انحراف سليم';
      vSub='الانحراف ضمن النطاق المتوقع لاختبار ' + r.label;
      body='الانحراف يقع داخل النطاق المتوقع لهذا النوع من الاختبارات. يدل ذلك على توزيع سليم يميز بين مستويات المتدربين، ويجعل المتوسط رقما ذا دلالة يعتمد عليه في القراءة.';
      rec='الوضع سليم. اتخذ هذه النتيجة خط أساس تقارن عليه الفصول القادمة لنفس الاختبار.';
    } else if (sdPct <= r.hi + 5) {
      sdState='أوسع من المثالي'; color=COLORS.warn; vText='انحراف أوسع من المثالي';
      vSub='الانحراف يتجاوز النطاق المتوقع لاختبار ' + r.label;
      body='الانحراف أوسع من المتوقع لهذا النوع من الاختبارات. لا يدعو ذلك للقلق بذاته، لكنه يستحق فحص توزيع الدرجات. قد يكون الفوج متباين القدرات، أو يكون الاختبار صعبا على فئة من المتدربين دون فئة.';
      rec='افحص توزيع الدرجات على الفئات. وإن ظهرت فئة متعثرة، فضع لها خطة تحسين قبل الفصل القادم.';
    } else {
      sdState='مرتفع'; color=COLORS.bad; vText='انحراف مرتفع';
      vSub='الانحراف يتجاوز النطاق المتوقع بفارق كبير';
      body='الانحراف مرتفع بفارق واضح عن المتوقع. يشير ذلك غالبا إلى انقسام الفصل إلى مجموعتين متمايزتين، إحداهما قوية والأخرى متعثرة، أو إلى وجود أسئلة في الاختبار يخطئ فيها الأقوياء ويصيب فيها الضعفاء بالتخمين.';
      rec='راجع توزيع الدرجات وحدد العامل الفاصل بين المجموعتين. وراجع أسئلة الاختبار التي قد تكون سبب الانقسام.';
    }

    // ملاحظة على موقع المتوسط
    let meanNote = '';
    if (tier === 'راسب') {
      meanNote = ' ومتوسط الفصل يقع في فئة الرسوب، مما يستدعي مراجعة مستوى الاختبار ومدى تغطيته لما درس، ووضع خطة تحسين للفصل.';
    } else if (meanPct > 92) {
      meanNote = ' ومتوسط الفصل مرتفع جدا، وقد يدل على اختبار سهل لا يفصل بين المستويات العليا.';
    }

    verdictBar.style.background = color;
    verdictText.textContent = vText;
    verdictSub.textContent = vSub;
    verdictBadge.textContent = 'σ ' + sd.toFixed(1) + ' / ' + t.max;
    mSdState.textContent = sdState;
    mSdState.style.color = color;
    analysisBody.textContent = 'متوسط الفصل يقع في فئة «' + tier + '» لهذا الاختبار. ' + body + meanNote;

    // شرح معامل الاختلاف تلقائيا
    let cvVerdict;
    if (cv < 12) cvVerdict = 'وهي نسبة منخفضة تدل على تقارب درجات الفصل';
    else if (cv < 20) cvVerdict = 'وهي ضمن النطاق المريح، تدل على تباعد سليم';
    else if (cv < 30) cvVerdict = 'وهي أوسع من المريح، تستحق فحص التوزيع';
    else cvVerdict = 'وهي نسبة مرتفعة تدل على تباعد كبير في الدرجات';
    cvNote.innerHTML = '<strong>معامل الاختلاف:</strong> يعبر عن الانحراف منسوبا إلى المتوسط، فيتيح مقارنة هذا الاختبار باختبارات أخرى تختلف درجاتها العظمى. بلغ هنا <span class="cv-val">' + cv.toFixed(1) + '%</span> (الانحراف ' + sd.toFixed(1) + ' ÷ المتوسط ' + mean.toFixed(1) + ')، ' + cvVerdict + '.';

    recommendBox.innerHTML = '<strong>التوصية:</strong> ' + rec;
  }

  inTest.addEventListener('change', () => { updateHint(); analyze(); });
  [inMean, inSd, inCount].forEach(el => {
    el.addEventListener('input', analyze);
    el.addEventListener('change', analyze);
  });
  updateHint();
})();

/* ============ القسم 3: المنحنى الجرسي ============ */
(function() {
  const canvas = document.getElementById('bellCanvas');
  const ctx = canvas.getContext('2d');
  const bMean = document.getElementById('bMean');
  const bSd = document.getElementById('bSd');
  const bMeanV = document.getElementById('bMeanV');
  const bSdV = document.getElementById('bSdV');
  const bR1 = document.getElementById('bR1');
  const bR2 = document.getElementById('bR2');
  const bCv = document.getElementById('bCv');

  const dpr = window.devicePixelRatio || 1;
  const W = 600, H = 320;
  canvas.width = W * dpr; canvas.height = H * dpr;
  canvas.style.width = '100%'; canvas.style.maxWidth = W + 'px';
  ctx.scale(dpr, dpr);

  function pdf(x, mu, s) {
    return (1/(s*Math.sqrt(2*Math.PI))) * Math.exp(-((x-mu)**2)/(2*s*s));
  }

  function draw() {
    const mu = parseFloat(bMean.value);
    const s = parseFloat(bSd.value);
    bMeanV.textContent = mu;
    bSdV.textContent = s;
    bR1.textContent = `${(mu-s).toFixed(0)} – ${(mu+s).toFixed(0)}`;
    bR2.textContent = `${Math.max(0,mu-2*s).toFixed(0)} – ${Math.min(100,mu+2*s).toFixed(0)}`;
    bCv.textContent = ((s/mu)*100).toFixed(1) + '%';

    ctx.clearRect(0,0,W,H);
    const pad = {l:45,r:25,t:25,b:45};
    const pw = W-pad.l-pad.r, ph = H-pad.t-pad.b;
    const xp = x => pad.l + (x/100)*pw;
    let maxY = 0;
    for (let x=0;x<=100;x+=0.5) maxY = Math.max(maxY, pdf(x,mu,s));
    const yp = y => pad.t + ph - (y/maxY)*ph*0.92;

    // تظليل ±1 انحراف
    ctx.fillStyle = 'rgba(34,185,176,0.20)';
    ctx.beginPath();
    ctx.moveTo(xp(Math.max(0,mu-s)), pad.t+ph);
    for (let x=Math.max(0,mu-s);x<=Math.min(100,mu+s);x+=0.5) ctx.lineTo(xp(x), yp(pdf(x,mu,s)));
    ctx.lineTo(xp(Math.min(100,mu+s)), pad.t+ph); ctx.closePath(); ctx.fill();

    // تظليل ±2 انحراف
    ctx.fillStyle = 'rgba(34,185,176,0.08)';
    [[Math.max(0,mu-2*s),Math.max(0,mu-s)],[Math.min(100,mu+s),Math.min(100,mu+2*s)]].forEach(([a,b])=>{
      ctx.beginPath(); ctx.moveTo(xp(a), pad.t+ph);
      for (let x=a;x<=b;x+=0.5) ctx.lineTo(xp(x), yp(pdf(x,mu,s)));
      ctx.lineTo(xp(b), pad.t+ph); ctx.closePath(); ctx.fill();
    });

    // المنحنى
    ctx.strokeStyle = '#168f88'; ctx.lineWidth = 2.5; ctx.beginPath();
    let first = true;
    for (let x=0;x<=100;x+=0.5){ const px=xp(x),py=yp(pdf(x,mu,s)); first?(ctx.moveTo(px,py),first=false):ctx.lineTo(px,py); }
    ctx.stroke();

    // خط المتوسط
    ctx.strokeStyle = '#b8503f'; ctx.lineWidth = 1.5; ctx.setLineDash([4,4]);
    ctx.beginPath(); ctx.moveTo(xp(mu),pad.t); ctx.lineTo(xp(mu),pad.t+ph); ctx.stroke(); ctx.setLineDash([]);

    // المحور
    ctx.strokeStyle = '#7b918f'; ctx.lineWidth = 1;
    ctx.beginPath(); ctx.moveTo(pad.l,pad.t+ph); ctx.lineTo(pad.l+pw,pad.t+ph); ctx.stroke();
    ctx.fillStyle = '#3f5a58'; ctx.font = '11px JetBrains Mono, monospace'; ctx.textAlign = 'center';
    for (let x=0;x<=100;x+=10){ ctx.beginPath(); ctx.moveTo(xp(x),pad.t+ph); ctx.lineTo(xp(x),pad.t+ph+4); ctx.stroke(); ctx.fillText(x,xp(x),pad.t+ph+18); }
    ctx.fillStyle = '#b8503f'; ctx.font = '600 12px Cairo, sans-serif'; ctx.fillText('المتوسط '+mu, xp(mu), pad.t-7);
    ctx.fillStyle = '#7b918f'; ctx.font = '12px Cairo, sans-serif'; ctx.fillText('الدرجة (0 إلى 100)', pad.l+pw/2, H-10);
  }
  bMean.addEventListener('input', draw);
  bSd.addEventListener('input', draw);
  draw();
})();
</script>

</body>
</html>
