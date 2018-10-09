import 'javascripts/application';
import 'stylesheets/application';

// auto import new images
const requireAll = r => r.keys().forEach(r);
requireAll(require.context('images', true));
