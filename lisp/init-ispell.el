(setq ispell-program-name "hunspell")

(setq ispell-tex-skip-alists
      '((;;("%\\[" . "%\\]") ; AMStex block comment...
	 ;; All the standard LaTeX keywords from L. Lamport's guide:
	 ;; \cite, \hspace, \hspace*, \hyphenation, \include, \includeonly, \input,
	 ;; \label, \nocite, \rule (in ispell - rest included here)
	 ("\\\\addcontentsline"              ispell-tex-arg-end 2)
	 ("\\\\add\\(tocontents\\|vspace\\)" ispell-tex-arg-end)
	 ("\\\\\\([aA]lph\\|arabic\\)"	 ispell-tex-arg-end)
	 ;;("\\\\author"			 ispell-tex-arg-end)
	 ("\\\\bibliographystyle"		 ispell-tex-arg-end)
	 ("\\\\makebox"			 ispell-tex-arg-end 0)
	 ("\\\\e?psfig"			 ispell-tex-arg-end)
	 ("\\\\document\\(class\\|style\\)" .
	  "\\\\begin[ \t\n]*{[ \t\n]*document[ \t\n]*}")
	 ;; Skip noweb sections
	 ("<<.*>>="	. "@")
	 )
	(;; delimited with \begin.  In ispell: displaymath, eqnarray, eqnarray*,
	 ;; equation, minipage, picture, tabular, tabular* (ispell)
	 ("\\(figure\\|table\\)\\*?"	 ispell-tex-arg-end 0)
	 ("list"				 ispell-tex-arg-end 2)
	 ("program"		. "\\\\end[ \t\n]*{[ \t\n]*program[ \t\n]*}")
	 ("verbatim\\*?"	. "\\\\end[ \t\n]*{[ \t\n]*verbatim\\*?[ \t\n]*}")
	 )
	))

