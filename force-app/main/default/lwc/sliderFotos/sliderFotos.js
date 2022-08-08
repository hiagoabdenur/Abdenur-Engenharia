import {
    LightningElement,
    api
} from 'lwc';
import {
    loadScript,
    loadStyle
} from 'lightning/platformResourceLoader';
import swiperLib from '@salesforce/resourceUrl/swiper';
import swiperCss from '@salesforce/resourceUrl/swiperCss';
import modalCss from '@salesforce/resourceUrl/modalCss';

export default class SliderFotos extends LightningElement {

    @api listaFotos;


    get listaFotos2() {
        return this.listaFotos.map(f => {
            return {
                url: f,
                style: `background: url(${f}) no-repeat center center fixed; -webkit-background-size: cover;  -moz-background-size: cover;  -o-background-size: cover; background-size: cover;`
            };
        });
    }

    //Carrega as bibliotecas dos recursos estáticos
    renderedCallback() {
        Promise.all([
                loadScript(this, swiperLib),
                loadStyle(this, swiperCss),
                loadStyle(this, modalCss)
            ])
            .then(() => {
                this.iniciarSwiper();
            })
            .catch(error => {
                const evt = new ShowToastEvent({
                    title: 'Erro.',
                    message: 'js e css não carregados.',
                    variant: 'error'
                });
                this.dispatchEvent(evt);
            });
    }

    iniciarSwiper() {
        var swiper = new Swiper(this.template.querySelector('.swiper-container'), {
            navigation: {
                nextEl: this.template.querySelector('.swiper-button-next'),
                prevEl: this.template.querySelector('.swiper-button-prev'),
            },
        });
    }

}