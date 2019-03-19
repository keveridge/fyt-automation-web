// disable_animations.js

/*
 CSS animations can cause flickering scenarios as Selenium is unable to wait for these to complete in the same
 way it can for Ajax requests.

 So we'll ensure they execute in 0 seconds instead
*/

var disableAnimationStyles = '-webkit-transition-duration: .0s !important;' +
    '-o-transition-duration: .0s !important;' +
    'transition-duration: .0s !important;';

var animationStyles = document.createElement('style');
animationStyles.type = 'text/css';
animationStyles.innerHTML = '* {' + disableAnimationStyles + '}';
document.head.appendChild(animationStyles);
