'use strict';
class Header {
    constructor(settings) {
        let obj = {
            title: settings.title ?? TP_DATA.title,
            group: settings.group ?? TP_DATA.group,
            links: settings.links ?? TP_DATA.link,
            otherLinks: settings.otherLinks ?? TP_DATA.otherLinks
        };
        this.header = document.createElement("header");
        const title = document.createElement("span");
        title.classList.add("title");
        title.innerText = `${obj.title} · ${obj.group}`;
        this.header.append(title);
        obj.links.map(link => {
            const linkEl = document.createElement("a");
            linkEl.setAttribute("href", link[1]);
            linkEl.innerText = link[0];
            this.header.append(linkEl);
        });
        for (let i = 0; i < 1; i++) {
            const space = document.createElement("div");
            space.classList.add("space");
            this.header.append(space);
        }
        obj.otherLinks.map(link => {
            const linkEl = document.createElement("a");
            linkEl.setAttribute("href", link[1]);
            linkEl.innerText = link[0];
            this.header.append(linkEl);
        });
    }
    putOnPage() {
        document.body.prepend(this.header);
    }
}
export default Header;