(require 'org-trello-elnode)
(require 'ert)
(require 'ert-expectations)
(require 'el-mock)

(expectations (desc "orgtrello-elnode/--dictionary-lessp")
 (expect t (and (orgtrello-elnode/--dictionary-lessp "a" "b")
                (null (orgtrello-elnode/--dictionary-lessp "b" "a"))
                (null (orgtrello-elnode/--dictionary-lessp "a" "a"))
                (orgtrello-elnode/--dictionary-lessp "1" "2")
                (null (orgtrello-elnode/--dictionary-lessp "2" "1"))
                (null (orgtrello-elnode/--dictionary-lessp "1" "1"))
                (orgtrello-elnode/--dictionary-lessp "1" "a")
                (null (orgtrello-elnode/--dictionary-lessp "a" "1"))
                (orgtrello-elnode/--dictionary-lessp "" "a")
                (null (orgtrello-elnode/--dictionary-lessp "a" ""))

                (orgtrello-elnode/--dictionary-lessp "ab12" "ab34")
                (orgtrello-elnode/--dictionary-lessp "ab12" "ab123")
                (orgtrello-elnode/--dictionary-lessp "ab12" "ab12d")
                (orgtrello-elnode/--dictionary-lessp "ab132" "ab132z")

                (orgtrello-elnode/--dictionary-lessp "132zzzzz" "ab132z")
                (null (orgtrello-elnode/--dictionary-lessp "1.32" "1ab")))))

(expectations (desc "orgtrello-elnode/compute-entity-level-dir")
              (expect (format "%sorg-trello/1/" elnode-webserver-docroot) (orgtrello-elnode/compute-entity-level-dir *ORGTRELLO/CARD-LEVEL*))
              (expect (format "%sorg-trello/2/" elnode-webserver-docroot) (orgtrello-elnode/compute-entity-level-dir *ORGTRELLO/CHECKLIST-LEVEL*))
              (expect (format "%sorg-trello/3/" elnode-webserver-docroot) (orgtrello-elnode/compute-entity-level-dir *ORGTRELLO/ITEM-LEVEL*)))

(expectations (desc "orgtrello-elnode/archived-scanning-dir")
              (expect "tests.scanning" (orgtrello-elnode/archived-scanning-dir "tests"))
              (expect "nil.scanning" (orgtrello-elnode/archived-scanning-dir nil)))

(provide 'org-trello-elnode-tests)
;;; org-trello-elnode-tests.el ends here
