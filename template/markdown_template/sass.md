```scss
// Variables
$primary-color: #3498db
$secondary-color: #2ecc71
$base-font-size: 16px
$spacing-unit: 8px

// Mixin with default values
@mixin border-radius($radius: 4px)
  -webkit-border-radius: $radius
  -moz-border-radius: $radius
  border-radius: $radius

// Function
@function calculate-rem($px-value)
  @return $px-value / $base-font-size * 1rem

// Base Styles
body
  font-family: Arial, sans-serif
  font-size: $base-font-size
  color: $primary-color
  background-color: lighten($secondary-color, 20%)
  
  // Nesting with pseudo-classes
  a
    color: $primary-color
    text-decoration: none
    &:hover
      text-decoration: underline

// Inheritance
.button
  @extend .base-button
  padding: $spacing-unit $spacing-unit * 2
  background-color: $primary-color
  color: white
  @include border-radius(6px)

// Conditional (if)
.container
  @if $primary-color == #3498db
    border: 1px solid darken($primary-color, 10%)
  @else
    border: 1px solid $secondary-color

// Loop (for, each)
@mixin generate-spacing-classes($property, $start, $end)
  @for $i from $start through $end
    .spacing-#{$property}-#{$i}
      #{$property}: $spacing-unit * $i

@include generate-spacing-classes(margin, 1, 5)
@include generate-spacing-classes(padding, 1, 5)

// Each loop with lists and maps
$themes: (dark: #333, light: #eee)

@each $name, $color in $themes
  .theme-#{$name}
    background-color: $color
    color: if($name == dark, white, black)

// Media Queries
@media screen and (min-width: 600px)
  .responsive-text
    font-size: calculate-rem(18px)

  .grid
    display: grid
    grid-template-columns: 1fr 1fr
    grid-gap: $spacing-unit * 2 

// Output compressed code (optional)
// SASS supports compressed output but typically through CLI settings.

```