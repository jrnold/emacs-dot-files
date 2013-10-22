(setq reftex-cite-format-biblatex 
      '((?\C-m . "\\cite[][]{%l}")
	(?C . "\\Cite[][]{%l}")
	;; "\\cites[][]{%l}"
	;; "\\Cites[][]{%l}"
	;; "\\cite*[][]{%l}"
	(?p . "\\parencite[][]{%l}")
	(?P . "\\Parencite[][]{%l}")
	;; "\\parencites[][]{%l}"
	;; "\\Parencites[][]{%l}"
	;; "\\parencite*[][]{%l}"
	(?f . "\\footcite[][]{%l}")
	(?F . "\\footcitetext[][]{%l}")
	;; "\\footcites[][]{%l}"
	;; "\\footcitetexts[][]{%l}"
	(?t . "\\textcite[][]{%l}")
	(?T . "\\Textcite[][]{%l}")
	;; "\\textcites[][]{%l}"
	;; "\\Textcites[][]{%l}"
	(?a . "\\autocite[][]{%l}")
	(?A . "\\Autocite[][]{%l}")
	;; "\\autocite[][]{%l}"
	;; "\\Autocite[][]{%l}"
	;; "\\autocite[][]{%l}"
	;; "\\Autocite[][]{%l}"
	(?r . "\\citeauthor[][]{%l}")
	(?R . "\\Citeauthor[][]{%l}")
	(?i . "\\citetitle[][]{%l}")
	(?I . "\\Citetitle*[][]{%l}")
	(?y . "\\citeyear[][]{%l}")
	(?e . "\\parentext[][]{%l}")
	(?b . "\\brackettext[][]{%l}")
	(?n . "\\nocite{%l}")
	(?l . "\\fullcite{%l}")
	(?L . "\\footfullcite{%l}")
	;; blank key
	(?k . "%l")
	;; Parencites
	(?z . "[][]{%l}")
	))

(setq 
 reftex-allow-detached-macro-args t
 reftex-plug-into-AUCTeX t
 reftex-cite-format reftex-cite-format-biblatex
 reftex-cite-prompt-optional-args t
 reftex-default-bibliography '("jabref")
 reftex-use-external-file-finders t
 reftex-external-file-finders
      '(("tex" . "kpsewhich -format=.tex %f")
        ("bib" . "kpsewhich -format=.bib %f")))
