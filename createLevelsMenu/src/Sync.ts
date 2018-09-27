module Game {
	export class Sync {
		private _phase: number = 0;

		private step: number = 0;

		public constructor(step: number) {
			this.step = step;
			this._phase = Math.random() * Math.PI * 2;
		}

		public get phase(): number {
			return this._phase;
		}

		public tick(): void {
			this._phase = this._phase + this.step;
			// §§push(true);
			if (this._phase > Math.PI * 2) {
				// this._phase.var_135 = true;
				// §§push(this);
			}
		}
	}
}