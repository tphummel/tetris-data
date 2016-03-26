today := $(shell date +%Y-%m-%d)

dist/%.sql:
		@[ -d dist ] || mkdir dist

		mysqldump \
			--quick \
			--add-drop-database \
			--comments \
			--quote-names \
			--extended-insert \
			--result-file=$@ \
			-h$(MYSQL_HOST) \
			-u$(MYSQL_USER) \
			-p$(MYSQL_PASS) \
			$(MYSQL_DB)

dist/%.sql.zip: sql
		zip -j -r $@ $(@D)/$(today).sql

dist/%.sql.tar.gz: sql
		tar czf $@ -C $(@D) $(today).sql

sql: dist/$(today).sql
zip: dist/$(today).sql.zip
tar: dist/$(today).sql.tar.gz
