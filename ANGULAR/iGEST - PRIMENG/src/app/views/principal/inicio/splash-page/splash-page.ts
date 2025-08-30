import { Component, OnInit, OnDestroy } from '@angular/core';
import { Router } from '@angular/router';
import { Vars } from '../../../../models/vars';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-splash-page',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './splash-page.html',
  styleUrl: './splash-page.css'
})
export class SplashPage implements OnInit, OnDestroy {
  private readonly animationDuration = 7000;
  private readonly transitionDuration = 250;

  logoScale = 0.1;
  logoOpacity = 0;
  progressValue = 0;
  countValue = 0;

  private animationStartTime = 0;
  private animationFrameId: number | null = null;
  private timeoutId: number | null = null;

  obUI = Vars.obMyUI;

  constructor(private router: Router) { }

  ngOnInit(): void {
    this.startAnimation();
  }

  ngOnDestroy(): void {
    this.cleanup();
  }

  private startAnimation(): void {
    this.animationStartTime = performance.now();
    this.animate();

    this.timeoutId = window.setTimeout(() => {
      this.navigateToLogin();
    }, this.animationDuration + this.transitionDuration);
  }

  private animate = (): void => {
    const currentTime = performance.now();
    const elapsed = currentTime - this.animationStartTime;
    const progress = Math.min(elapsed / this.animationDuration, 1);

    this.logoScale = this.easeOut(progress) * 0.9 + 0.1;
    this.logoOpacity = this.easeIn(progress);
    this.progressValue = progress;
    this.countValue = Math.floor(progress * 100);

    if (progress < 1) {
      this.animationFrameId = requestAnimationFrame(this.animate);
    }
  }

  private easeOut(t: number): number {
    return 1 - Math.pow(1 - t, 3);
  }

  private easeIn(t: number): number {
    return t * t;
  }

  private navigateToLogin(): void {
    document.body.classList.add('splash-exit');
    setTimeout(() => {
      this.router.navigate(['/login']);
    }, this.transitionDuration);
  }

  private cleanup(): void {
    if (this.animationFrameId) cancelAnimationFrame(this.animationFrameId);
    if (this.timeoutId) clearTimeout(this.timeoutId);
    document.body.classList.remove('splash-exit');
  }

  getLogoPath(): string {
    return `https://storage.googleapis.com/igest-public/logos/logo_${this.obUI.idEmpresa}.png`;
  }

  getLogoStyles(): any {
    return {
      transform: `scale(${this.logoScale})`,
      opacity: this.logoOpacity
    };
  }

  getTextColor(): string {
    return this.obUI.colorLabelPri;
  }

  getBackgroundColor(): string {
    return this.obUI.colorFondoDK;
  }
}
